
=begin
* Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
* For licensing, see LICENSE.html or http://ckeditor.com/license
=end

=begin
 * \brief CKEditor class that can be used to create editor
 * instances in PHP pages on server side.
 * @see http://ckeditor.com
 *
 * Sample usage:
 * @code
 * $CKEditor = new CKEditor();
 * $CKEditor->editor("editor1", "<p>Initial value.</p>");
 * @endcode
=end


class CKEditor
  #The version of %CKEditor.
  VERSION = '3.6.2'
  
  #A constant string unique for each release of %CKEditor.
  TIMESTAMP = 'B8DJ5M3'
  
=begin
   * URL to the %CKEditor installation directory (absolute or relative to document root).
   * If not set, CKEditor will try to guess it's path.
   *
   * Example usage:
   * @code
   * $CKEditor->basePath = '/ckeditor/';
   * @endcode
=end
  attr_accessor :base_path
  
=begin
   * An array that holds the global %CKEditor configuration.
   * For the list of available options, see http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html
   *
   * Example usage:
   * @code
   * $CKEditor->config['height'] = 400;
   * // Use @@ at the beggining of a string to ouput it without surrounding quotes.
   * $CKEditor->config['width'] = '@@screen.width * 0.8';
   * @endcode
=end
  attr_accessor :config

=begin
   * A boolean variable indicating whether CKEditor has been initialized.
   * Set it to true only if you have already included
   * &lt;script&gt; tag loading ckeditor.js in your website.
=end
  attr_accessor :initialized
  
=begin
   * Boolean variable indicating whether created code should be printed out or returned by a function.
   *
   * Example 1: get the code creating %CKEditor instance and print it on a page with the "echo" function.
   * @code
   * $CKEditor = new CKEditor();
   * $CKEditor->returnOutput = true;
   * $code = $CKEditor->editor("editor1", "<p>Initial value.</p>");
   * echo "<p>Editor 1:</p>";
   * echo $code;
   * @endcode
=end
  attr_accessor :return_output
  
=begin
   * An array with textarea attributes.
   *
   * When %CKEditor is created with the editor() method, a HTML &lt;textarea&gt; element is created,
   * it will be displayed to anyone with JavaScript disabled or with incompatible browser.
=end
  attr_accessor :textarea_attributes
  
=begin
   * A string indicating the creation date of %CKEditor.
   * Do not change it unless you want to force browsers to not use previously cached version of %CKEditor.
=end
  attr_accessor :timestamp
  
=begin
   * Main Constructor.
   *
   *  @param $basePath (string) URL to the %CKEditor installation directory (optional).
=end
  def initialize(args = {})
    args = {"base_path" => args} if args.is_a?(String)
    
    @args = {
      #default arguments should go here.
    }.merge(args)
    @config = {}
    @initialized = false
    @return_output = false
    @textarea_attributes = {"rows" => 8, "cols" => 60}
    @timestamp = "B8DJ5M3"
    @events = {}
    @global_events = {}
    @base_path = @args["base_path"] if @args["base_path"].to_s.strip.length > 0
  end
  
  def on_meta(&block)
    @on_meta = block
  end
  
=begin
   * Creates a %CKEditor instance.
   * In incompatible browsers %CKEditor will downgrade to plain HTML &lt;textarea&gt; element.
   *
   * @param $name (string) Name of the %CKEditor instance (this will be also the "name" attribute of textarea element).
   * @param $value (string) Initial value (optional).
   * @param $config (array) The specific configurations to apply to this editor instance (optional).
   * @param $events (array) Event listeners for this editor instance (optional).
   *
   * Example usage:
   * @code
   * $CKEditor = new CKEditor();
   * $CKEditor->editor("field1", "<p>Initial value.</p>");
   * @endcode
   *
   * Advanced example:
   * @code
   * $CKEditor = new CKEditor();
   * $config = array();
   * $config['toolbar'] = array(
   *     array( 'Source', '-', 'Bold', 'Italic', 'Underline', 'Strike' ),
   *     array( 'Image', 'Link', 'Unlink', 'Anchor' )
   * );
   * $events['instanceReady'] = 'function (ev) {
   *     alert("Loaded: " + ev.editor.name);
   * }';
   * $CKEditor->editor("field1", "<p>Initial value.</p>", $config, $events);
   * @endcode
=end
  def editor(name, value = "", config = {}, events = {})
    attr = "";
    @textarea_attributes.each do |key, val|
      attr << " #{key}=\"#{val.to_s.gsub('"', '&quot')}\""
    end
    
    out = "<textarea name=\"#{name}\"#{attr}>#{Knj::Web.html(value)}</textarea>\n"
    if !@initialized
      out << self.init
    end
    
    _config = self.config_settings(config, events)
    
    js = self.return_global_events
    
    if _config.empty?
      js << "CKEDITOR.replace('#{name}', #{self.js_encode(_config)});"
    else
      js << "CKEDITOR.replace('#{name}');"
    end

    out << self.script(js)
    
    if !@return_output
      print out
      out = ""
    end
    
    return out
  end

=begin
   * Replaces a &lt;textarea&gt; with a %CKEditor instance.
   *
   * @param $id (string) The id or name of textarea element.
   * @param $config (array) The specific configurations to apply to this editor instance (optional).
   * @param $events (array) Event listeners for this editor instance (optional).
   *
   * Example 1: adding %CKEditor to &lt;textarea name="article"&gt;&lt;/textarea&gt; element:
   * @code
   * $CKEditor = new CKEditor();
   * $CKEditor->replace("article");
   * @endcode
=end
  def replace(id, config = {}, events = {})
    out = "";
    if !@initialized
      out << self.init
    end

    _config = self.config_settings(config, events)

    js = self.return_global_events
    if !_config.empty?
      js << "CKEDITOR.replace('#{id}', #{self.js_encode(_config)});"
    else
      js << "CKEDITOR.replace('#{id}');"
    end
    
    out << self.script(js)
    
    if !@return_output
      print out
      out = ""
    end
    
    return out
  end

=begin
   * Replace all &lt;textarea&gt; elements available in the document with editor instances.
   *
   * @param $className (string) If set, replace all textareas with class className in the page.
   *
   * Example 1: replace all &lt;textarea&gt; elements in the page.
   * @code
   * $CKEditor = new CKEditor();
   * $CKEditor->replaceAll();
   * @endcode
   *
   * Example 2: replace all &lt;textarea class="myClassName"&gt; elements in the page.
   * @code
   * $CKEditor = new CKEditor();
   * $CKEditor->replaceAll( 'myClassName' );
   * @endcode
=end
  def replace_all(class_name = nil)
    out = "";
    if !@initialized
      out << self.init
    end

    _config = self.config_settings

    js = self.return_global_events
    if _config.empty?
      if class_name.to_s.strip.length <= 0
        js << "CKEDITOR.replaceAll();"
      else
        js << "CKEDITOR.replaceAll('#{class_name}');"
      end
    else
      class_detection = ""
      js << "CKEDITOR.replaceAll( function(textarea, config) {\n"
      if class_name.to_s.strip.length > 0
        js << "  var classRegex = new RegExp('(?:^| )' + '#{class_name}' + '(?:$| )');\n"
        js << "  if (!classRegex.test(textarea.className))\n"
        js << "    return false;\n"
      end
      
      js << "  CKEDITOR.tools.extend(config, #{self.js_encode(_config)}, true);"
      js << "} );"
    end
    
    out << self.script(js)
    
    if !@return_output
      print out
      out = ""
    end

    return out
  end

=begin
   * Adds event listener.
   * Events are fired by %CKEditor in various situations.
   *
   * @param $event (string) Event name.
   * @param $javascriptCode (string) Javascript anonymous function or function name.
   *
   * Example usage:
   * @code
   * $CKEditor->addEventHandler('instanceReady', 'function (ev) {
   *     alert("Loaded: " + ev.editor.name);
   * }');
   * @endcode
=end
  def add_event_handler(event, javascript_code)
    unless @events.key?(event)
      @events[event] = []
    end
    
    #Avoid duplicates.
    if @events[event].index(javascript_code) == nil
      @events[event] << javascript_code
    end
  end

=begin
   * Clear registered event handlers.
   * Note: this function will have no effect on already created editor instances.
   *
   * @param $event (string) Event name, if not set all event handlers will be removed (optional).
=end
  def clear_event_handlers(event = nil)
    if event.to_s.strip.length > 0
      @events[event] = []
    else
      @events = []
    end
  end

=begin
   * Adds global event listener.
   *
   * @param $event (string) Event name.
   * @param $javascriptCode (string) Javascript anonymous function or function name.
   *
   * Example usage:
   * @code
   * $CKEditor->addGlobalEventHandler('dialogDefinition', 'function (ev) {
   *     alert("Loading dialog: " + ev.data.name);
   * }');
   * @endcode
=end
  def add_global_event_handler(event, javascript_code)
    unless @global_events.key?(event)
      @global_events[event] = []
    end
    
    #Avoid duplicates.
    if @global_events.index(javascript_code) == nil
      @global_events[event] << javascript_code
    end
  end

=begin
   * Clear registered global event handlers.
   * Note: this function will have no effect if the event handler has been already printed/returned.
   *
   * @param $event (string) Event name, if not set all event handlers will be removed (optional).
=end
  def clear_global_event_handlers(event = nil)
    if event.to_s.strip.length > 0
      @global_events[event] = []
    else
      @global_events = []
    end
  end

=begin
   * Prints javascript code.
   *
   * @param string $js
=end
  def script(js)
    out = "<script type=\"text/javascript\">"
    out << "//<![CDATA[\n"
    out << js
    out << "\n//]]>"
    out << "</script>\n"

    return out
  end

=begin
   * Returns the configuration array (global and instance specific settings are merged into one array).
   *
   * @param $config (array) The specific configurations to apply to editor instance.
   * @param $events (array) Event listeners for editor instance.
=end
  def config_settings(config = {}, events = {})
    _config = @config
    _events = @events
    
    if config.is_a?(Hash) and !config.empty?
      _config = _config.merge(config)
    end
    
    if events.is_a?(Hash) and !events.empty?
      events.each do |event_name, code|
        if !_events.key?(event_name)
          _events[event_name] = []
        end
        
        if _events[event_name].index(code) == nil
          _events[event_name] << code
        end
      end
    end

    if _events.empty?
      _events.each do |event_name, handlers|
        if handlers.empty?
          next
        elsif handlers.length == 1
          _config['on'][event_name] = '@@#{handlers[0]}'
        else
          _config['on'][event_name] = '@@function (ev){'
          handlers.each do |handler, code|
            _config['on'][event_name] << '(#{code})(ev);'
          end
          
          _config['on'][event_name] << '}'
        end
      end
    end
    
    return _config;
  end

  #Return global event handlers.
  def return_global_events
    out = "";
    
    @returned_events = {} if !@returnedEvents
    
    if !@global_events.empty?
      @global_events.each do |event_name, handlers|
        handlers.each do |handler, code|
          if !@returned_events.key?(event_name)
            @returned_events[event_name] = []
          end
          
          #Return only new events
          if !@returned_events[event_name].key?(code)
            if code.to_s.strip.length > 0
              out << "\n"
            end
            
            out << "CKEDITOR.on('#{eventName}', #{code});"
            @returned_events[eventName] << code
          end
        end
      end
    end

    return out
  end
  
  #Initializes CKEditor (executed only once).
  def init
    out = "";
    
    if !@init_complete
      return ""
    end
    
    if @initialized
      @init_complete = true
      return ""
    end
    
    args = ""
    ckeditor_path = self.ckeditorPath
    
    if @timestamp and @timestamp != CKEditor::TIMESTAMP
      args = "?t=#{@timestamp}"
    end
    
    #Skip relative paths...
    if @ckeditor_path.index("..") != 0
      out << self.script("window.CKEDITOR_BASEPATH='#{ckeditor_path}';")
    end
    
    out << "<script type=\"text/javascript\" src=\"#{ckeditor_path}ckeditor.js#{args}\"></script>\n"
    
    extra_code = ""
    if @timestamp != self.timestamp
      if extra_code.to_s.strip.length > 0
        extra_code << "\n"
      end
      
      extra_code << "CKEDITOR.timestamp = '#{@timestamp}';"
    end
    
    if extra_code.to_s.strip.length > 0
      out << self.script(extra_code)
    end

    @init_complete = @initialized = true

    return out
  end

  #Return path to ckeditor.js.
  def ckeditor_path
    if @base_path.to_s.strip.length > 0
      return @base_path
    end

=begin
     * The absolute pathname of the currently executing script.
     * Note: If a script is executed with the CLI, as a relative path, such as file.php or ../file.php,
     * $_SERVER['SCRIPT_FILENAME'] will contain the relative path specified by the user.
=end
    raise "No 'on_meta'-block has been set. Please call the method 'CKeditor#on_meta' with a block that returns meta-data as a hash."
    meta_data = @on_meta.call
    raise "Invalid meta-data returned: '#{meta_data.class.name}'." if !meta_data or !meta_data.is_a?(Hash)
    
    if meta_data.key?("SCRIPT_FILENAME") and meta_data["SCRIPT_FILENAME"].to_s.strip.length > 0
      real_path = File.dirname(meta_data["SCRIPT_FILENAME"])
    else
      #realpath - Returns canonicalized absolute pathname
      real_path = File.realpath('./')
    end

=begin
     * The filename of the currently executing script, relative to the document root.
     * For instance, $_SERVER['PHP_SELF'] in a script at the address http://example.com/test.php/foo.bar
     * would be /test.php/foo.bar.
=end
    
    #FIXME: How do we do this in Ruby?
    #self_path = File.dirname($_SERVER['PHP_SELF']);
    #$file = str_replace("\\", "/", __FILE__);
    self_path = nil
    
    if !self_path or !real_path or !file
      return "/ckeditor/"
    end
    
    document_root = real_path[0, real_path.length - self_path.length]
    file_url = file[document_root.length, file.length]
    ckeditor_url = file_url.gsub("ckeditor_knjappserver.rb", "")
    
    return ckeditor_url
  end

=begin
   * This little function provides a basic JSON support.
   *
   * @param mixed $val
   * @return string
=end
  def js_encode(val)
    #Just use the JSON-lib... Too much expencive work to maintain this code? - knj.
    return JSON.generate(val)
    
    if val.nil?
      return 'null'
    elsif val == true
      return "true"
    elsif val == false
      return "false"
    elsif val.is_a?(Integer) or val.is_a?(Fixnum) or val.is_a?(Float)
      return val
    elsif val.is_a?(Array) or val.is_a?(Hash) or val.is_a?(String)
      return JSON.generate(val)
    end
    
    raise "Could not JSON-encode that object: '#{val.class.name}'."
    
    #elsif  is_object($val)) {
    #  if (is_array($val) && (array_keys($val) === range(0,count($val)-1))) {
    #    return '[' . implode(',', array_map(array($this, 'jsEncode'), $val)) . ']';
    #  }
    #  $temp = array();
    #  foreach ($val as $k => $v){
    #    $temp[] = $this->jsEncode("{$k}") . ':' . $this->jsEncode($v);
    #  }
    #  return '{' . implode(',', $temp) . '}';
    #}
    #// String otherwise
    #if (strpos($val, '@@') === 0)
    #  return substr($val, 2);
    #if (strtoupper(substr($val, 0, 9)) == 'CKEDITOR.')
    #  return $val;
    #return '"' . str_replace(array("\\", "/", "\n", "\t", "\r", "\x08", "\x0c", '"'), array('\\\\', '\\/', '\\n', '\\t', '\\r', '\\b', '\\f', '\"'), $val) . '"';
  end
end

/**
 * ${1:{{name}}}{{?func: vmustache#InitCounter("params", 1)}}
 *
 * @since `echo $CODE_VERSION`
 *{{#parameters}}
 * @param ${{{?func: vmustache#IncrementCounter("params")}}:{{type}}{{^type}}mixed{{/type}}} ${{name}}${{{?func: vmustache#IncrementCounter("params")}}}{{/parameters}}
 */

# @tauri-apps/plugin-notification

Send toast notifications (brief auto-expiring OS window element) to your user.
Can also be used with the Notification Web API.

## [Enumerations](#enumerations)

### [Importance](#importance)

#### [Enumeration Members](#enumeration-members)

##### [Default](#default)

```

Default: 3;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L287>

##### [High](#high)

```

High: 4;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L288>

##### [Low](#low)

```

Low: 2;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L286>

##### [Min](#min)

```

Min: 1;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L285>

##### [None](#none)

```

None: 0;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L284>

---

### [ScheduleEvery](#scheduleevery)

#### [Enumeration Members](#enumeration-members-1)

##### [Day](#day)

```

Day: "day";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L159>

##### [Hour](#hour)

```

Hour: "hour";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L160>

##### [Minute](#minute)

```

Minute: "minute";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L161>

##### [Month](#month)

```

Month: "month";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L156>

##### [Second](#second)

```

Second: "second";

```

Not supported on iOS.

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L165>

##### [TwoWeeks](#twoweeks)

```

TwoWeeks: "twoWeeks";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L157>

##### [Week](#week)

```

Week: "week";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L158>

##### [Year](#year)

```

Year: "year";

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L155>

---

### [Visibility](#visibility)

#### [Enumeration Members](#enumeration-members-2)

##### [Private](#private)

```

Private: 0;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L293>

##### [Public](#public)

```

Public: 1;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L294>

##### [Secret](#secret)

```

Secret: -1;

```

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L292>

## [Classes](#classes)

### [Schedule](#schedule)

#### [Constructors](#constructors)

##### [new Schedule()](#new-schedule)

```

new Schedule(): Schedule

```

###### [Returns](#returns)

[`Schedule`](notification.md)

#### [Properties](#properties)

| Property | Type | Defined in |
| --- | --- | --- |
| `at` | `undefined` | `object` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L169> |
| `every` | `undefined` | `object` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L184> |
| `interval` | `undefined` | `object` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L177> |

#### [Methods](#methods)

##### [at()](#at)

```

static at(

date,

repeating,

allowWhileIdle): Schedule

```

###### [Parameters](#parameters)

| Parameter | Type | Default value |
| --- | --- | --- |
| `date` | [`Date`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Date) | `undefined` |
| `repeating` | `boolean` | `false` |
| `allowWhileIdle` | `boolean` | `false` |

###### [Returns](#returns-1)

[`Schedule`](notification.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L192>

##### [every()](#every)

```

static every(

kind,

count,

allowWhileIdle): Schedule

```

###### [Parameters](#parameters-1)

| Parameter | Type | Default value |
| --- | --- | --- |
| `kind` | [`ScheduleEvery`](notification.md) | `undefined` |
| `count` | `number` | `undefined` |
| `allowWhileIdle` | `boolean` | `false` |

###### [Returns](#returns-2)

[`Schedule`](notification.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L211>

##### [interval()](#interval)

```

static interval(interval, allowWhileIdle): Schedule

```

###### [Parameters](#parameters-2)

| Parameter | Type | Default value |
| --- | --- | --- |
| `interval` | [`ScheduleInterval`](notification.md) | `undefined` |
| `allowWhileIdle` | `boolean` | `false` |

###### [Returns](#returns-3)

[`Schedule`](notification.md)

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L200>

## [Interfaces](#interfaces)

### [Action](#action)

#### [Properties](#properties-1)

| Property | Type | Defined in |
| --- | --- | --- |
| `destructive?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L239> |
| `foreground?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L238> |
| `id` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L235> |
| `input?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L240> |
| `inputButtonTitle?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L241> |
| `inputPlaceholder?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L242> |
| `requiresAuthentication?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L237> |
| `title` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L236> |

---

### [ActionType](#actiontype)

#### [Properties](#properties-2)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `actions` | [`Action`](notification.md)[] | The list of associated actions | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L253> |
| `allowInCarPlay?` | `boolean` | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L256> |
| `customDismissAction?` | `boolean` | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L255> |
| `hiddenPreviewsBodyPlaceholder?` | `string` | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L254> |
| `hiddenPreviewsShowSubtitle?` | `boolean` | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L258> |
| `hiddenPreviewsShowTitle?` | `boolean` | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L257> |
| `id` | `string` | The identifier of this action type | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L249> |

---

### [ActiveNotification](#activenotification)

#### [Properties](#properties-3)

| Property | Type | Defined in |
| --- | --- | --- |
| `actionTypeId?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L278> |
| `attachments` | [`Attachment`](notification.md)[] | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L277> |
| `body?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L272> |
| `data` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, `string`> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L275> |
| `extra` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, `unknown`> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L276> |
| `group?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L273> |
| `groupSummary` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L274> |
| `id` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L269> |
| `schedule?` | [`Schedule`](notification.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L279> |
| `sound?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L280> |
| `tag?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L270> |
| `title?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L271> |

---

### [Attachment](#attachment)

Attachment of a notification.

#### [Properties](#properties-4)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `id` | `string` | Attachment identifier. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L229> |
| `url` | `string` | Attachment URL. Accepts the `asset` and `file` protocols. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L231> |

---

### [Channel](#channel)

#### [Properties](#properties-5)

| Property | Type | Defined in |
| --- | --- | --- |
| `description?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L300> |
| `id` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L298> |
| `importance?` | [`Importance`](notification.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L305> |
| `lightColor?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L303> |
| `lights?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L302> |
| `name` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L299> |
| `sound?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L301> |
| `vibration?` | `boolean` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L304> |
| `visibility?` | [`Visibility`](notification.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L306> |

---

### [Options](#options)

Options to send a notification.

#### [Since](#since)

2.0.0

#### [Properties](#properties-6)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `actionTypeId?` | `string` | Defines an action type for this notification. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L62> |
| `attachments?` | [`Attachment`](notification.md)[] | Notification attachments. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L104> |
| `autoCancel?` | `boolean` | Automatically cancel the notification when the user clicks on it. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L120> |
| `body?` | `string` | Optional notification body. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L44> |
| `channelId?` | `string` | Identifier of the [Channel](notification.md) that deliveres this notification. If the channel does not exist, the notification won’t fire. Make sure the channel exists with listChannels and [createChannel](notification.md). | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L36> |
| `extra?` | [`Record`](https://www.typescriptlang.org/docs/handbook/utility-types.html#recordkeys-type)<`string`, `unknown`> | Extra payload to store in the notification. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L108> |
| `group?` | `string` | Identifier used to group multiple notifications. <https://developer.apple.com/documentation/usernotifications/unmutablenotificationcontent/1649872-threadidentifier> | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L68> |
| `groupSummary?` | `boolean` | Instructs the system that this notification is the summary of a group on Android. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L72> |
| `icon?` | `string` | Notification icon. On Android the icon must be placed in the app’s `res/drawable` folder. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L90> |
| `iconColor?` | `string` | Icon color on Android. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L100> |
| `id?` | `number` | The notification identifier to reference this object later. Must be a 32-bit integer. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L29> |
| `inboxLines?` | `string`[] | List of lines to add to the notification. Changes the notification style to inbox. Cannot be used with `largeBody`. Only supports up to 5 lines. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L84> |
| `largeBody?` | `string` | Multiline text. Changes the notification style to big text. Cannot be used with `inboxLines`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L54> |
| `largeIcon?` | `string` | Notification large icon (Android). The icon must be placed in the app’s `res/drawable` folder. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L96> |
| `number?` | `number` | Sets the number of items this notification represents on Android. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L132> |
| `ongoing?` | `boolean` | If true, the notification cannot be dismissed by the user on Android. An application service must manage the dismissal of the notification. It is typically used to indicate a background task that is pending (e.g. a file download) or the user is engaged with (e.g. playing music). | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L116> |
| `schedule?` | [`Schedule`](notification.md) | Schedule this notification to fire on a later time or a fixed interval. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L48> |
| `silent?` | `boolean` | Changes the notification presentation to be silent on iOS (no badge, no sound, not listed). | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L124> |
| `sound?` | `string` | The sound resource name. Only available on mobile. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L76> |
| `summary?` | `string` | Detail text for the notification with `largeBody`, `inboxLines` or `groupSummary`. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L58> |
| `title` | `string` | Notification title. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L40> |
| `visibility?` | [`Visibility`](notification.md) | Notification visibility. | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L128> |

---

### [PendingNotification](#pendingnotification)

#### [Properties](#properties-7)

| Property | Type | Defined in |
| --- | --- | --- |
| `body?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L264> |
| `id` | `number` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L262> |
| `schedule` | [`Schedule`](notification.md) | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L265> |
| `title?` | `string` | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L263> |

---

### [ScheduleInterval](#scheduleinterval)

#### [Properties](#properties-8)

| Property | Type | Description | Defined in |
| --- | --- | --- | --- |
| `day?` | `number` | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L138> |
| `hour?` | `number` | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L149> |
| `minute?` | `number` | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L150> |
| `month?` | `number` | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L137> |
| `second?` | `number` | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L151> |
| `weekday?` | `number` | 1 - Sunday 2 - Monday 3 - Tuesday 4 - Wednesday 5 - Thursday 6 - Friday 7 - Saturday | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L148> |
| `year?` | `number` | - | **Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L136> |

## [Type Aliases](#type-aliases)

### [PermissionState](#permissionstate)

```

type PermissionState: "granted" | "denied" | "prompt" | "prompt-with-rationale";

```

**Source**: undefined

## [Functions](#functions)

### [active()](#active)

```

function active(): Promise<ActiveNotification[]>

```

Retrieves the list of active notifications.

#### [Returns](#returns-4)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`ActiveNotification`](notification.md)[]>

A promise resolving to the list of active notifications.

#### [Example](#example)

```

import { active } from '@tauri-apps/plugin-notification';

const activeNotifications = await active();

```

#### [Since](#since-1)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L459>

---

### [cancel()](#cancel)

```

function cancel(notifications): Promise<void>

```

Cancels the pending notifications with the given list of identifiers.

#### [Parameters](#parameters-3)

| Parameter | Type |
| --- | --- |
| `notifications` | `number`[] |

#### [Returns](#returns-5)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example-1)

```

import { cancel } from '@tauri-apps/plugin-notification';

await cancel([-34234, 23432, 4311]);

```

#### [Since](#since-2)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L425>

---

### [cancelAll()](#cancelall)

```

function cancelAll(): Promise<void>

```

Cancels all pending notifications.

#### [Returns](#returns-6)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example-2)

```

import { cancelAll } from '@tauri-apps/plugin-notification';

await cancelAll();

```

#### [Since](#since-3)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L442>

---

### [channels()](#channels)

```

function channels(): Promise<Channel[]>

```

Retrieves the list of notification channels.

#### [Returns](#returns-7)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`Channel`](notification.md)[]>

A promise resolving to the list of notification channels.

#### [Example](#example-3)

```

import { channels } from '@tauri-apps/plugin-notification';

const notificationChannels = await channels();

```

#### [Since](#since-4)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L553>

---

### [createChannel()](#createchannel)

```

function createChannel(channel): Promise<void>

```

Creates a notification channel.

#### [Parameters](#parameters-4)

| Parameter | Type |
| --- | --- |
| `channel` | [`Channel`](notification.md) |

#### [Returns](#returns-8)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example-4)

```

import { createChannel, Importance, Visibility } from '@tauri-apps/plugin-notification';

await createChannel({

id: 'new-messages',

name: 'New Messages',

lights: true,

vibration: true,

importance: Importance.Default,

visibility: Visibility.Private

});

```

#### [Since](#since-5)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L519>

---

### [isPermissionGranted()](#ispermissiongranted)

```

function isPermissionGranted(): Promise<boolean>

```

Checks if the permission to send notifications is granted.

#### [Returns](#returns-9)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`boolean`>

#### [Example](#example-5)

```

import { isPermissionGranted } from '@tauri-apps/plugin-notification';

const permissionGranted = await isPermissionGranted();

```

#### [Since](#since-6)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L319>

---

### [onAction()](#onaction)

```

function onAction(cb): Promise<PluginListener>

```

#### [Parameters](#parameters-5)

| Parameter | Type |
| --- | --- |
| `cb` | (`notification`) => `void` |

#### [Returns](#returns-10)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`PluginListener`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L563>

---

### [onNotificationReceived()](#onnotificationreceived)

```

function onNotificationReceived(cb): Promise<PluginListener>

```

#### [Parameters](#parameters-6)

| Parameter | Type |
| --- | --- |
| `cb` | (`notification`) => `void` |

#### [Returns](#returns-11)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`PluginListener`>

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L557>

---

### [pending()](#pending)

```

function pending(): Promise<PendingNotification[]>

```

Retrieves the list of pending notifications.

#### [Returns](#returns-12)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<[`PendingNotification`](notification.md)[]>

A promise resolving to the list of pending notifications.

#### [Example](#example-6)

```

import { pending } from '@tauri-apps/plugin-notification';

const pendingNotifications = await pending();

```

#### [Since](#since-7)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L408>

---

### [registerActionTypes()](#registeractiontypes)

```

function registerActionTypes(types): Promise<void>

```

Register actions that are performed when the user clicks on the notification.

#### [Parameters](#parameters-7)

| Parameter | Type |
| --- | --- |
| `types` | [`ActionType`](notification.md)[] |

#### [Returns](#returns-13)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example-7)

```

import { registerActionTypes } from '@tauri-apps/plugin-notification';

await registerActionTypes([{

id: 'tauri',

actions: [{

id: 'my-action',

title: 'Settings'

}]

}])

```

#### [Since](#since-8)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L391>

---

### [removeActive()](#removeactive)

```

function removeActive(notifications): Promise<void>

```

Removes the active notifications with the given list of identifiers.

#### [Parameters](#parameters-8)

| Parameter | Type |
| --- | --- |
| `notifications` | `object`[] |

#### [Returns](#returns-14)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example-8)

```

import { cancel } from '@tauri-apps/plugin-notification';

await cancel([-34234, 23432, 4311])

```

#### [Since](#since-9)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L476>

---

### [removeAllActive()](#removeallactive)

```

function removeAllActive(): Promise<void>

```

Removes all active notifications.

#### [Returns](#returns-15)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example-9)

```

import { removeAllActive } from '@tauri-apps/plugin-notification';

await removeAllActive()

```

#### [Since](#since-10)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L495>

---

### [removeChannel()](#removechannel)

```

function removeChannel(id): Promise<void>

```

Removes the channel with the given identifier.

#### [Parameters](#parameters-9)

| Parameter | Type |
| --- | --- |
| `id` | `string` |

#### [Returns](#returns-16)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`void`>

A promise indicating the success or failure of the operation.

#### [Example](#example-10)

```

import { removeChannel } from '@tauri-apps/plugin-notification';

await removeChannel();

```

#### [Since](#since-11)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L536>

---

### [requestPermission()](#requestpermission)

```

function requestPermission(): Promise<NotificationPermission>

```

Requests the permission to send notifications.

#### [Returns](#returns-17)

[`Promise`](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Promise)<`NotificationPermission`>

A promise resolving to whether the user granted the permission or not.

#### [Example](#example-11)

```

import { isPermissionGranted, requestPermission } from '@tauri-apps/plugin-notification';

let permissionGranted = await isPermissionGranted();

if (!permissionGranted) {

const permission = await requestPermission();

permissionGranted = permission === 'granted';

}

```

#### [Since](#since-12)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L342>

---

### [sendNotification()](#sendnotification)

```

function sendNotification(options): void

```

Sends a notification to the user.

#### [Parameters](#parameters-10)

| Parameter | Type |
| --- | --- |
| `options` | `string` | [`Options`](notification.md) |

#### [Returns](#returns-18)

`void`

#### [Example](#example-12)

```

import { isPermissionGranted, requestPermission, sendNotification } from '@tauri-apps/plugin-notification';

let permissionGranted = await isPermissionGranted();

if (!permissionGranted) {

const permission = await requestPermission();

permissionGranted = permission === 'granted';

}

if (permissionGranted) {

sendNotification('Tauri is awesome!');

sendNotification({ title: 'TAURI', body: 'Tauri is awesome!' });

}

```

#### [Since](#since-13)

2.0.0

**Source**: <https://github.com/tauri-apps/plugins-workspace/blob/v2/plugins/notification/guest-js/index.ts#L364>

[Previous   
 nfc](nfc.md)   [Next   
 opener](opener.md)

 

---

© 2025 Tauri Contributors. CC-BY / MIT
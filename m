Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB4E13699F
	for <imx@lists.linux.dev>; Tue,  6 Feb 2024 11:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707220495; cv=none; b=HCWXRC/yiMsVm1HK5Rbydo/ppL7dQTt4cEoWf8Sel8LPsa0avNyRDwfas4Vv0hFfrYHhBfe1c4W+KbI4dYYfOQ1n2eTt2iXM6Qa10M8JY4MvrXK/n75M+v8Fs/fhHnjmaWQXKjadeH76UGSEmPWQQtj2epwiOJEYARovdcrNVNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707220495; c=relaxed/simple;
	bh=huQERr2I8KInHIO2lB1YDA3403COnVXjH7Omud6kihM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B5kNKmUmsnV30Ez5dmb5ybRq/DkO73HRaZtvzyp5BjQ7k7c1yMOu7YCun31AqtAHbZD0493A5hcb3UPe+rEBAv+JGZ+utE7aAiZ/JeEJMIWJanG94m5UtQtM0dUUpNQxFpSHBchxZxAShR1Cg9nFn2uIn1gaT2iPPhE3olcwbyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqU8FHfx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqU8FHfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707220493; x=1738756493;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=huQERr2I8KInHIO2lB1YDA3403COnVXjH7Omud6kihM=;
  b=FqU8FHfxbcXyV/7ox7zjUz/nX1jIRPL9LCxaCiz+PLYLZ95YOhPXMBPg
   h58xbu8KNzJYMo1DQfPzkzBD8+LIeni5ZaJzzs/WAaAidU/4UfeEKAAR+
   7LYQmrWTiic715HJt2ShjALc4O5xKWoaXvEYJQt+lnny8rRdq4poXZY3O
   wZ7/2l/zzQLgnGHGjRxg1J0lmvZpK/ZxIjFWClHmJ281ywdbSf2ZbLRdD
   MtelgbJJVX4YueCE0iD9qp5Jr4HbEinAWoW2gj1TCWKKE1qsUp6krOIjE
   ANtlDe51As1UtOwkDJnbCQjR0NrfWPUmLQa6RNEUUK/tQBjNJUWmvf1j0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4540215"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="4540215"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 03:54:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5599711"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.36.139])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 03:54:48 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 Feb 2024 13:54:42 +0200 (EET)
To: Frank Li <Frank.Li@nxp.com>
cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com, 
    devicetree@vger.kernel.org, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, imx@lists.linux.dev, 
    Jiri Slaby <jirislaby@kernel.org>, joe@perches.com, 
    krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org, 
    linux-i3c@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, miquel.raynal@bootlin.com, 
    robh@kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v7 6/8] i3c: target: func: add tty driver
In-Reply-To: <20240205233326.552576-7-Frank.Li@nxp.com>
Message-ID: <9b5bb389-4238-0a32-5e16-3c62ea6c00e7@linux.intel.com>
References: <20240205233326.552576-1-Frank.Li@nxp.com> <20240205233326.552576-7-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Feb 2024, Frank Li wrote:

> Add tty over I3C target function driver.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v4 to v5
>     - remove void*
>     - include bitfield.h
>     - remove extra ()
>     - oneline for struct ttyi3c_port *sport
> 
>  drivers/i3c/Kconfig       |   3 +
>  drivers/i3c/Makefile      |   1 +
>  drivers/i3c/func/Kconfig  |   9 +
>  drivers/i3c/func/Makefile |   3 +
>  drivers/i3c/func/tty.c    | 474 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 490 insertions(+)
>  create mode 100644 drivers/i3c/func/Kconfig
>  create mode 100644 drivers/i3c/func/Makefile
>  create mode 100644 drivers/i3c/func/tty.c
> 
> diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> index d59a7eb83d13a..fca808cda87b3 100644
> --- a/drivers/i3c/Kconfig
> +++ b/drivers/i3c/Kconfig
> @@ -48,3 +48,6 @@ config I3C_TARGET_CONFIGFS
>  	  the target function and used to bind the function with a target
>  	  controller.
>  
> +if I3C_TARGET
> +source "drivers/i3c/func/Kconfig"
> +endif # I3C_TARGET
> diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
> index c275aeae8970c..11f026d6876fe 100644
> --- a/drivers/i3c/Makefile
> +++ b/drivers/i3c/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_I3C)		+= i3c.o
>  obj-$(CONFIG_I3C_TARGET)                += target.o
>  obj-$(CONFIG_I3C_TARGET_CONFIGFS)       += i3c-cfs.o
>  obj-$(CONFIG_I3C)		+= master/
> +obj-$(CONFIG_I3C_TARGET)	+= func/
> diff --git a/drivers/i3c/func/Kconfig b/drivers/i3c/func/Kconfig
> new file mode 100644
> index 0000000000000..7115129eb7d5a
> --- /dev/null
> +++ b/drivers/i3c/func/Kconfig
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config I3C_TARGET_FUNC_TTY
> +	tristate "I3C target tty driver"
> +	depends on I3C_TARGET
> +	help
> +	  I3C Target TTY Function Driver.
> +
> +	  General TTY over I3C target controller function drivers.
> diff --git a/drivers/i3c/func/Makefile b/drivers/i3c/func/Makefile
> new file mode 100644
> index 0000000000000..16b3b9301496b
> --- /dev/null
> +++ b/drivers/i3c/func/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_I3C_TARGET_FUNC_TTY)              += tty.o
> diff --git a/drivers/i3c/func/tty.c b/drivers/i3c/func/tty.c
> new file mode 100644
> index 0000000000000..50673bfb6a003
> --- /dev/null
> +++ b/drivers/i3c/func/tty.c
> @@ -0,0 +1,474 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 NXP
> + * Author: Frank Li <Frank.Li@nxp.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/iopoll.h>
> +#include <linux/i3c/target.h>
> +#include <linux/serial_core.h>
> +#include <linux/slab.h>
> +#include <linux/tty_flip.h>
> +
> +static DEFINE_IDR(i3c_tty_minors);
> +
> +static struct tty_driver *i3c_tty_driver;
> +
> +#define I3C_TTY_MINORS		8
> +
> +#define I3C_TX_NOEMPTY		BIT(0)
> +#define I3C_TTY_TRANS_SIZE	16
> +#define I3C_TTY_IBI_TX		BIT(0)

This is #include <linux/bits.h>

...which will include <vdso/bits.h> that contains the actual definition.

#include <bitfield.h> is for FIELD_GET/PREP(), etc.

> +struct ttyi3c_port {
> +	struct tty_port port;
> +	int minor;
> +	struct i3c_target_func *i3cdev;
> +	struct completion txcomplete;
> +	spinlock_t xlock;
> +	void *buffer;
> +	struct work_struct work;

This file seems to also lack some includes. Please go through your 
#include in the series and add those you use.

-- 
 i.


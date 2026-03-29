Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A78225F99F
	for <imx@lists.linux.dev>; Sun, 29 Mar 2026 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801130; cv=pass; b=tW024pPcMdAWq255tvf2ZL4ClX4NwDwGZg1c41hJDoPuL1RkKEFt6R8e+vnuG+dx4s0TQ6LGTAxAt4dZ71d60Coaj4fus6B6eNsqiUvP6FjG8xVCgjUpcU6SzOSKitSnbgANWQI6zTK/+b0Y9VUfXwEULEyRjqV5Z9G3I12DvMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801130; c=relaxed/simple;
	bh=xQqCvaSYvMDehLMpCAi2Exo2F9/DzAf4RUjSbu4AXqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+W0ulMeKyrH4zHwGuOELdrm3YQ+1v2nDp6PXPeyd015g/yuIyQkOaw6SWFIKDv2GwLj2Cov/ELppYEsxhN1j/ZnCDL2ij+9jZY2h/6b0N/p1kdiOHhDfDygrQbln0XMUTRH/bMiQyii8wU11uDlqjJ3NMJ9HpwjKQ7NX/yxtDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7cxJx+l; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7cxJx+l"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4670bcc40d7so1204947b6e.2
        for <imx@lists.linux.dev>; Sun, 29 Mar 2026 09:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801127; cv=none;
        d=google.com; s=arc-20240605;
        b=T3YR+PSaIYHdiOINm5ou5zCTFWHEZeuiF5HfncOvCzZQsGbnjyjfhV12YyxfHzIdB/
         5GxG9msZt/XpuVArgVsAdQVdtBiUcG8t0HLmVZjOmVEWMeFlX5LjVPU7qfoD9viVvS0E
         HJtAPi2py7yEXjy211zA3NGv+NFR8k2v/quTfwzxEs3OlRFJAjNoY+8umKxVosQb0kxc
         1+/mV20m1SGqsEi0w0Sb88YcWGgxfIkuBfZuyLbBSx5hRxD5IpmUraaocQYHw8eQUQ4t
         uN+WtF3X0PXPN/C8pT1fDvKvIz0DshI9O5awi9fcn1SdfHMmU+jiRGSt4PWI5WXzX57g
         FEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WxRWrohRC+fNvhhMsjBNKWfMlLneWiOcUehlHfN3ctw=;
        fh=13xHbIR8gJptDYZxLOmXoM/1M56wQzSLSSyqT+3kyD0=;
        b=Km4mTz5NvwW1WuaRGIYfkp4Qj2POLQ/QehDZp9i7ZHAv2FCzc2M4MfTK6I8DBJPOLY
         Y0eh27A6AbkYc2OEb5rXewYarWRbM3uC0GObeDEkG9sPKKBpuDhFJOniQThv1SPYsQWu
         38D8YiGGkTFCQMAa0l9STUIdsW1dIGoa+ZQb7UNjNeVR6VGkwcLWSuTXUev0X3CV8apo
         UOn4KYBPL9E8aIxrUI0aLaSSHSG6A8ypMLpkKI3gP0UOT8WNSupf6U08DridlamWFcd4
         ZIxOWXgwCq7tyAOYJZif/O6XSxJB6OjDv/3rs7Jcw0i1f49lX1LBgNr9OHjKGf0MoekN
         mUJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801127; x=1775405927; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxRWrohRC+fNvhhMsjBNKWfMlLneWiOcUehlHfN3ctw=;
        b=W7cxJx+lqsE/9gpzfa2/94v9om3D8MXMZ8acoIV02BGmSFqdgY1jxoDTZIVEfimi8K
         m/bdFUw8wKtnwDrxngq5yWpMsnGuX3IS7rOFB3XPkY1oN79rl/a3xWoUQM3VlprerjA6
         dGkZ5xYhxaE8T3DT0Cr0Nrf0nmEuqHwXBS3x8jGZyo3IWj1uMQMFOhsIbu3QwDccLW7c
         8H50ivQDrc4wYWO/BxfancpxirbE8XD7iadp1pXaMBXMARvhkCxha3VhRyk0nZMuiZc3
         55MShF7L0pwofJjnPfA+9wd46utVN9u+JaAY9yKn18rH+bBrTYYWy7bkbw2k5MPMeiNt
         UMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801127; x=1775405927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WxRWrohRC+fNvhhMsjBNKWfMlLneWiOcUehlHfN3ctw=;
        b=iGG4MtsLb6yOGrYGIBzwIrcLHnGHGmQdvCI7JblXfft8/R+4lRWpIbGeyM7N2Irz1R
         ckbr6VPhgt+Fv5uWZC5kxjobw3SGcByWtVGCKmrJ0uFXGWJL/a3aD07umv78BtdcZYcz
         gmX/SZ4nDNtPoFWKo1g6P5uiPjfhvfUBUHd5Da67v0f2VNyEMEd14jO2aBIk7EVt6lm7
         N7R98Bnn6PbJbpeqiRIG6LsgMIiz0ND4Dd2h1xITlj5FMwE11eU5hbqHYyRa2LdwFc8M
         4/SdSVs/dGA4sF+evpDSYlvsr8XPtUFXImeTC2n0AO65r+ZlwXS0xel6VEwvEiRQ3vMf
         cKfg==
X-Forwarded-Encrypted: i=1; AJvYcCVn+u8ZjJjrNjIEQ+PZgEToJHUKUJ2xbCpil1f/Cs0keStB/LYbN8DvFjoXr8Fl/uCMWyY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVI5pKvXygcugdD4sekOicgC+FHlAmcvpkM7qQ4FpdAGSwnAeX
	5tjiHnS9lcXgpUva5VsQtTY+R8UilfzWes/mZS0zn6UI8GgdyVudgp3meRNUUCdL8RJ6gxnWwl+
	tBaqg7uKba7/UklnOmSGWHIaXDytLXVU=
X-Gm-Gg: ATEYQzx42CW0bnBCyr2hzGS9r0S4d5wlDM/HIBM/6dU5vAFsNUCXqO1ewCwcZyDwt9j
	FVYL5tBes98of9LEmAAH46p+TL47TuZBzSDGSMuONhGaROviMaGVDPkApLRqK6CF7APZkot8pIY
	OOXzU/sPhBvsoZ04kcm+gIxtoU8fsrOyawdr2bhinxGd3/9zHMJCQYtQq+6B8XAozF/N/aigivk
	k5HVHH+OpeLzWjAcJZs01g/UXAc/UixSvhBnImeeo6iDXFwGLhWMxNo4znqlXtVqAxC2f+QXxVC
	dn3P+Vms
X-Received: by 2002:a05:6808:1909:b0:466:f25d:3281 with SMTP id
 5614622812f47-46a8a535f24mr4527393b6e.29.1774801127539; Sun, 29 Mar 2026
 09:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327151112.5202-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260327151112.5202-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:18:36 -0500
X-Gm-Features: AQROBzAT0Y7MQA0Vu0exbVKBXS_ASbnND8ZlhVVTpfO0frVJ0Okq55qzNtMBYvo
Message-ID: <CABb+yY3J2T5c4=dGaqPYi3L=88zgTqRn6AJwxBJ9Sqx6aDH8jw@mail.gmail.com>
Subject: Re: [PATCH v3] mailbox: remove superfluous internal header
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Peter Chen <peter.chen@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 10:11=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Quite some controller drivers use the defines from the internal header
> already. This prevents controller drivers outside the mailbox directory.
> Move the defines to the public controller header to allow this again as
> the defines are not strictly internal anyhow.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>
> Changes since v2:
> * rebased to 7.0-rc5
> * add tag (Thanks, Daniel!)
>
>  drivers/mailbox/cix-mailbox.c      |  2 --
>  drivers/mailbox/hi3660-mailbox.c   |  2 --
>  drivers/mailbox/imx-mailbox.c      |  2 --
>  drivers/mailbox/mailbox-sti.c      |  2 --
>  drivers/mailbox/mailbox.c          |  2 --
>  drivers/mailbox/mailbox.h          | 12 ------------
>  drivers/mailbox/omap-mailbox.c     |  2 --
>  drivers/mailbox/pcc.c              |  2 --
>  drivers/mailbox/tegra-hsp.c        |  2 --
>  include/linux/mailbox_controller.h |  5 +++++
>  10 files changed, 5 insertions(+), 28 deletions(-)
>  delete mode 100644 drivers/mailbox/mailbox.h
>
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.=
c
> index 443620e8ae37..864f98f21fc3 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -12,8 +12,6 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>
> -#include "mailbox.h"
> -
>  /*
>   * The maximum transmission size is 32 words or 128 bytes.
>   */
> diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-ma=
ilbox.c
> index 17c29e960fbf..9b727a2b54a5 100644
> --- a/drivers/mailbox/hi3660-mailbox.c
> +++ b/drivers/mailbox/hi3660-mailbox.c
> @@ -15,8 +15,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> -#include "mailbox.h"
> -
>  #define MBOX_CHAN_MAX                  32
>
>  #define MBOX_RX                                0x0
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index 003f9236c35e..22331b579489 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -23,8 +23,6 @@
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
>
> -#include "mailbox.h"
> -
>  #define IMX_MU_CHANS           24
>  /* TX0/RX0/RXDB[0-3] */
>  #define IMX_MU_SCU_CHANS       6
> diff --git a/drivers/mailbox/mailbox-sti.c b/drivers/mailbox/mailbox-sti.=
c
> index b4b5bdd503cf..b6c9ecbbc8ec 100644
> --- a/drivers/mailbox/mailbox-sti.c
> +++ b/drivers/mailbox/mailbox-sti.c
> @@ -21,8 +21,6 @@
>  #include <linux/property.h>
>  #include <linux/slab.h>
>
> -#include "mailbox.h"
> -
>  #define STI_MBOX_INST_MAX      4      /* RAM saving: Max supported insta=
nces */
>  #define STI_MBOX_CHAN_MAX      20     /* RAM saving: Max supported chann=
els  */
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index e63b2292ee7a..9d41a1ab9018 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -18,8 +18,6 @@
>  #include <linux/property.h>
>  #include <linux/spinlock.h>
>
> -#include "mailbox.h"
> -
>  static LIST_HEAD(mbox_cons);
>  static DEFINE_MUTEX(con_mutex);
>
> diff --git a/drivers/mailbox/mailbox.h b/drivers/mailbox/mailbox.h
> deleted file mode 100644
> index e1ec4efab693..000000000000
> --- a/drivers/mailbox/mailbox.h
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -
> -#ifndef __MAILBOX_H
> -#define __MAILBOX_H
> -
> -#include <linux/bits.h>
> -
> -#define TXDONE_BY_IRQ  BIT(0) /* controller has remote RTR irq */
> -#define TXDONE_BY_POLL BIT(1) /* controller can read status of last TX *=
/
> -#define TXDONE_BY_ACK  BIT(2) /* S/W ACK received by Client ticks the TX=
 */
> -
> -#endif /* __MAILBOX_H */
> diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbo=
x.c
> index d9f100c18895..5772c6b9886a 100644
> --- a/drivers/mailbox/omap-mailbox.c
> +++ b/drivers/mailbox/omap-mailbox.c
> @@ -22,8 +22,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/mailbox_controller.h>
>
> -#include "mailbox.h"
> -
>  #define MAILBOX_REVISION               0x000
>  #define MAILBOX_MESSAGE(m)             (0x040 + 4 * (m))
>  #define MAILBOX_FIFOSTATUS(m)          (0x080 + 4 * (m))
> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 22e70af1ae5d..636879ae1db7 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -59,8 +59,6 @@
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <acpi/pcc.h>
>
> -#include "mailbox.h"
> -
>  #define MBOX_IRQ_NAME          "pcc-mbox"
>
>  /**
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index ed9a0bb2bcd8..2231050bb5a9 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -16,8 +16,6 @@
>
>  #include <dt-bindings/mailbox/tegra186-hsp.h>
>
> -#include "mailbox.h"
> -
>  #define HSP_INT_IE(x)          (0x100 + ((x) * 4))
>  #define HSP_INT_IV             0x300
>  #define HSP_INT_IR             0x304
> diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_c=
ontroller.h
> index 80a427c7ca29..16fef421c30c 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -3,6 +3,7 @@
>  #ifndef __MAILBOX_CONTROLLER_H
>  #define __MAILBOX_CONTROLLER_H
>
> +#include <linux/bits.h>
>  #include <linux/completion.h>
>  #include <linux/device.h>
>  #include <linux/hrtimer.h>
> @@ -11,6 +12,10 @@
>
>  struct mbox_chan;
>
> +#define TXDONE_BY_IRQ  BIT(0) /* controller has remote RTR irq */
> +#define TXDONE_BY_POLL BIT(1) /* controller can read status of last TX *=
/
> +#define TXDONE_BY_ACK  BIT(2) /* S/W ACK received by Client ticks the TX=
 */
> +
>  /**
>   * struct mbox_chan_ops - methods to control mailbox channels
>   * @send_data: The API asks the MBOX controller driver, in atomic
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

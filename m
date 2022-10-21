Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE287E
	for <imx@lists.linux.dev>; Fri, 21 Oct 2022 01:52:33 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id d8so1563897uaw.11
        for <imx@lists.linux.dev>; Thu, 20 Oct 2022 18:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A/X4BKH1+5rJ4rbxYZrtmnGpMfEo4yCisAmPOP1kbwI=;
        b=M1GYgGlvvgUTcch6G0ibTLp+6fc1JTaQJHMyXkIR4uQ03w4fh6+GVol4YfXPqi+xz0
         4bx75Zypsbg7LWhAv/PGMNY8DoZ74eUDLp16JKOVc8TY9z803fSXSjUwfR6KwO744mWD
         vfCD2D/Iy3lQjyjOd+24dOpvyzMtteSVv9NhrzX2Fpk5yprLsoouMmVW5QT7g2cWBzTO
         UBwQql7Pd6zXXwcZVY+E9IATn6hKOaBcjjTBIYF4AzlaXWvdGwbtK1JN9vAZJCJ3HvmG
         irEXycAbXu3m0tUs1Fl15ke3N9VkBwsOw+avhOinTLYIjkYnboUpHYtIByzQxlp9MGfv
         QyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/X4BKH1+5rJ4rbxYZrtmnGpMfEo4yCisAmPOP1kbwI=;
        b=OAQw2QQ3bD1AyxBZ+oNEC6uJFv2KyzwDsHOPf2IE32CiZfKjT96gjL9tp5NSctsdBF
         BSbtBsKX0f7lEt+oWjQMLwEl17dcNsXX/aQZQT8iamAshL/Z5NsclOrRdsP5zdlZfkES
         0H5wHOKIECRmKVdjGc/fbp5R1gCT6TOSDCBxn/zWlp7019FE+lKBqZeqHHi08FTsycPW
         vmr0LVnXe96+E1bczO+sGbk7kIvopIZI/fIgUf7bsGQuSSItzIIuBB5kwd4lDEz1kn2p
         mQcPPfbPeiEjgEimnG03Id9ROJlltIQuSHXTHCNHgU54z5MoQlflNUL0E5WsGeErJW2T
         dkVQ==
X-Gm-Message-State: ACrzQf3ChtQfDDMG3V2H3+ltibkR4ut19z8Qiji0v5e+i2izdHBO7UKK
	RmAomGNwZS/Nmku3PJ/zqbdCdRFeTtfQzUte1YU=
X-Google-Smtp-Source: AMsMyM4qCIRUEQcZArW6VI8G3qndhgaFIp97VM27Zqwd3N05qAAwpR9XHHFc6IGzp1r775XT/G/ASF8jzfSuB7tqfD8=
X-Received: by 2002:ab0:6511:0:b0:3e1:935d:3cc0 with SMTP id
 w17-20020ab06511000000b003e1935d3cc0mr10408297uam.93.1666317152011; Thu, 20
 Oct 2022 18:52:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221019152117.1234968-1-Frank.Li@nxp.com>
In-Reply-To: <20221019152117.1234968-1-Frank.Li@nxp.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Fri, 21 Oct 2022 09:51:46 +0800
Message-ID: <CAL411-pHPiPeY0QTiMUwrGes+K9tQpq0OwVOnCHHkg7Aq2zy4g@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: cdns3: host: fix endless superspeed hub port reset
To: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, Pawel Laszczak <pawell@cadence.com>, 
	Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
	Aswath Govindraju <a-govindraju@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:CADENCE USBSSP DRD IP DRIVER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 19, 2022 at 11:21 PM Frank Li <Frank.Li@nxp.com> wrote:
>
> From: Li Jun <jun.li@nxp.com>
>
> When usb 3.0 hub connect with one USB 2.0 device and NO USB 3.0 device,
> some usb hub reports endless port reset message.
>
> [  190.324169] usb 2-1: new SuperSpeed USB device number 88 using xhci-hcd
> [  190.352834] hub 2-1:1.0: USB hub found
> [  190.356995] hub 2-1:1.0: 4 ports detected
> [  190.700056] usb 2-1: USB disconnect, device number 88
> [  192.472139] usb 2-1: new SuperSpeed USB device number 89 using xhci-hcd
> [  192.500820] hub 2-1:1.0: USB hub found
> [  192.504977] hub 2-1:1.0: 4 ports detected
> [  192.852066] usb 2-1: USB disconnect, device number 89
>
> The reason is the runtime pm state of USB2.0 port is active and
> USB 3.0 port is suspend, so parent device is active state.
>
>  cat /sys/bus/platform/devices/5b110000.usb/5b130000.usb/xhci-hcd.1.auto/usb2/power/runtime_status
>
>  suspended
>
>  cat /sys/bus/platform/devices/5b110000.usb/5b130000.usb/xhci-hcd.1.auto/usb1/power/runtime_status
>
>  active
>
>  cat /sys/bus/platform/devices/5b110000.usb/5b130000.usb/xhci-hcd.1.auto/power/runtime_status
>
>  active
>
>  cat /sys/bus/platform/devices/5b110000.usb/5b130000.usb/power/runtime_status
>
>  active
>
> So xhci_cdns3_suspend_quirk() have not called. U3 configure is not applied.
>
> move U3 configure into host start
>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/usb/cdns3/host.c | 58 +++++++++++++++++++++-------------------
>  1 file changed, 31 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
> index 9643b905e2d8..9092b6f4d7c4 100644
> --- a/drivers/usb/cdns3/host.c
> +++ b/drivers/usb/cdns3/host.c
> @@ -24,11 +24,41 @@
>  #define CFG_RXDET_P3_EN                BIT(15)
>  #define LPM_2_STB_SWITCH_EN    BIT(25)
>
> -static int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd);
> +static void xhci_cdns3_plat_start(struct usb_hcd *hcd)
> +{
> +       struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> +       u32 value;
> +
> +       /* set usbcmd.EU3S */
> +       value = readl(&xhci->op_regs->command);
> +       value |= CMD_PM_INDEX;
> +       writel(value, &xhci->op_regs->command);
> +
> +       if (hcd->regs) {
> +               value = readl(hcd->regs + XECP_AUX_CTRL_REG1);
> +               value |= CFG_RXDET_P3_EN;
> +               writel(value, hcd->regs + XECP_AUX_CTRL_REG1);
> +
> +               value = readl(hcd->regs + XECP_PORT_CAP_REG);
> +               value |= LPM_2_STB_SWITCH_EN;
> +               writel(value, hcd->regs + XECP_PORT_CAP_REG);
> +       }
> +}
> +
> +static int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
> +{
> +       if (pm_runtime_status_suspended(hcd->self.controller))
> +               return 0;
> +
> +       xhci_cdns3_plat_start(hcd);
> +

Why does it need to call again at suspend?

Peter

> +       return 0;
> +}
>
>  static const struct xhci_plat_priv xhci_plat_cdns3_xhci = {
>         .quirks = XHCI_SKIP_PHY_INIT | XHCI_AVOID_BEI,
>         .suspend_quirk = xhci_cdns3_suspend_quirk,
> +       .plat_start = xhci_cdns3_plat_start,
>  };
>
>  static int __cdns_host_init(struct cdns *cdns)
> @@ -90,32 +120,6 @@ static int __cdns_host_init(struct cdns *cdns)
>         return ret;
>  }
>
> -static int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
> -{
> -       struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> -       u32 value;
> -
> -       if (pm_runtime_status_suspended(hcd->self.controller))
> -               return 0;
> -
> -       /* set usbcmd.EU3S */
> -       value = readl(&xhci->op_regs->command);
> -       value |= CMD_PM_INDEX;
> -       writel(value, &xhci->op_regs->command);
> -
> -       if (hcd->regs) {
> -               value = readl(hcd->regs + XECP_AUX_CTRL_REG1);
> -               value |= CFG_RXDET_P3_EN;
> -               writel(value, hcd->regs + XECP_AUX_CTRL_REG1);
> -
> -               value = readl(hcd->regs + XECP_PORT_CAP_REG);
> -               value |= LPM_2_STB_SWITCH_EN;
> -               writel(value, hcd->regs + XECP_PORT_CAP_REG);
> -       }
> -
> -       return 0;
> -}
> -
>  static void cdns_host_exit(struct cdns *cdns)
>  {
>         kfree(cdns->xhci_plat_data);
> --
> 2.34.1
>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469263431E5
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 14:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601285; cv=none; b=bSAWyvk1EK08QRxY7ziaV7Z6sG1QIZ5TjoMtoCTrGpxLtXkvWnwgsTC9E0IwXAITT3WAGX5rhrtNdgRoa4pc7+SqT1qPBNOKHlTYFX5jOz6gmS0voHTtNZClEPnUCIP4ffx2q59p/kAAoLsCngaVBXUbrdjZNHllrbLP5YeN1hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601285; c=relaxed/simple;
	bh=uoQdb6KUh0zj1AASTwEQij8pwLif6KCbM5jHPhoIw5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMlAvuLDkgx1+wFMdnpZjBV2PjGawMXlQbpgXbQO57hgHpIeKSjX0rhDtYEa64CxlSuos1kzOZ7IxuPAyTQXZOAMRCQpxvxVOtzAOorBKtzxYUX5inMccRdW+DCTjvtwXHsqHqWPWSaV/e5CdPr9GL0kQHvpGE5Jtxg8I9v3ro0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0OGOqvk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0OGOqvk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DB2C4CEFC
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 14:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757601285;
	bh=uoQdb6KUh0zj1AASTwEQij8pwLif6KCbM5jHPhoIw5c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h0OGOqvk0CVxW4YdtWZ9dtQCbkoKy73gF5U/GMpYM1YHf5cYofU/XILrKA4Sfkjs4
	 PIy3M/ix6Mul2IYXXXeWh9k3KJ8kECmmL/Fln4MBdCHOb89pvd3sPArP3lScS/c6v+
	 rBBGD3RH96o0Oj4vpYc/L1Z6fr5c+HB9yOBTyOOaZU5cNdrTh31VHtgfeZbSy/YKar
	 T/ojWvUwBVFOWwdqOyD7PbvlHIIQCangsw5e+sJ+rV0K0VLTEjxv9GNFW+0mkeqQY5
	 QQhwaIe/6UdYSOGWX76MGIh5Wz6pEZ5OWXsWKUyYArihq7kFGbvPomtCn1xrXX1TTi
	 TXFI7NO0yInRw==
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-750c5378b96so381843a34.0
        for <imx@lists.linux.dev>; Thu, 11 Sep 2025 07:34:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyQbMlTvAnm4w+vqvTpGXPF76rWsSvoMTKEYt/MWci8pdEmJIVM2ESbcgglklaEYvgaqE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTHUSfb0lkjnQ86MTMVz4MPn7nFrk67PZyj/0dgKS3Otkcct4y
	oYZcOJ/xlnYKvk4G8dT0sAyg0ZmfTD9EvK47SUMKUNyeOYNdV8oh7xVDhHM5dlyfDN924Mb5zTW
	FOuSp7X0TMivWyGKf2EzkuplNLA8jb3U=
X-Google-Smtp-Source: AGHT+IHoaHBgQs9JMOU5Bms+OKeweDbQhBu9/QSxdG9LNHsMd6lPvcbNq8F0dxWYXIE1QHlFbguSd6lXGjyUef1x2Dg=
X-Received: by 2002:a05:6830:d09:b0:745:a24e:4624 with SMTP id
 46e09a7af769-751dec97a93mr1905872a34.5.1757601284384; Thu, 11 Sep 2025
 07:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250908053335.36685-1-xu.yang_2@nxp.com> <20250908053335.36685-3-xu.yang_2@nxp.com>
 <CAGTfZH3VhDLyWD4brdyAHPLNv=UnCjpFA0SrUV8BEoArGYdm4Q@mail.gmail.com>
In-Reply-To: <CAGTfZH3VhDLyWD4brdyAHPLNv=UnCjpFA0SrUV8BEoArGYdm4Q@mail.gmail.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Thu, 11 Sep 2025 23:34:07 +0900
X-Gmail-Original-Message-ID: <CAGTfZH0-7LfJpoNDWJM9jceVvsJ37nv2Rzzb-vT8HweCxWWKdA@mail.gmail.com>
X-Gm-Features: Ac12FXyGD71xrwyRXZvEVm1Rhk87eOeEPPVbELP3rg1rpMxdpquVHJfRWaRx4tU
Message-ID: <CAGTfZH0-7LfJpoNDWJM9jceVvsJ37nv2Rzzb-vT8HweCxWWKdA@mail.gmail.com>
Subject: Re: [RESEND v4 3/4] extcon: ptn5150: Add Type-C orientation switch support
To: Xu Yang <xu.yang_2@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, 
	robh@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org, 
	swboyd@chromium.org, heikki.krogerus@linux.intel.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

In order to prevent build error, I dropped the patch from extcon.git
and reply Ack for this patch.

Thanks.

On Wed, Sep 10, 2025 at 12:34=E2=80=AFAM Chanwoo Choi <chanwoo@kernel.org> =
wrote:
>
> Hi,
>
> Applied it. Thanks.
>
> On Mon, Sep 8, 2025 at 2:34=E2=80=AFPM Xu Yang <xu.yang_2@nxp.com> wrote:
> >
> > PTN5150 is able to detect CC polarity. The field[1:0] of CC status
> > register (04H) will keep the result.
> >
> >   00: Cable Not Attached
> >   01: CC1 is connected (normal orientation)
> >   10: CC2 is connected (reversed orientation)
> >   11: Reserved
> >
> > Add orientation switch support to correctly set orientation of
> > multiplexer according to CC status.
> >
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v4:
> >  - add Rb tag
> > Changes in v3:
> >  - no changes
> > Changes in v2:
> >  - move "enum typec_orientation orient" ahead
> >  - improve commit message
> > ---
> >  drivers/extcon/Kconfig          |  1 +
> >  drivers/extcon/extcon-ptn5150.c | 40 +++++++++++++++++++++++++++++++++
> >  2 files changed, 41 insertions(+)
> >
> > diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> > index a6f6d467aacf..fd4ec5dda0b7 100644
> > --- a/drivers/extcon/Kconfig
> > +++ b/drivers/extcon/Kconfig
> > @@ -145,6 +145,7 @@ config EXTCON_PTN5150
> >         tristate "NXP PTN5150 CC LOGIC USB EXTCON support"
> >         depends on I2C && (GPIOLIB || COMPILE_TEST)
> >         depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
> > +       depends on TYPEC || !TYPEC
> >         select REGMAP_I2C
> >         help
> >           Say Y here to enable support for USB peripheral and USB host
> > diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-pt=
n5150.c
> > index 78ad86c4a3be..768428d306ce 100644
> > --- a/drivers/extcon/extcon-ptn5150.c
> > +++ b/drivers/extcon/extcon-ptn5150.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/extcon-provider.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/usb/role.h>
> > +#include <linux/usb/typec_mux.h>
> >
> >  /* PTN5150 registers */
> >  #define PTN5150_REG_DEVICE_ID                  0x01
> > @@ -38,7 +39,11 @@
> >  #define PTN5150_REG_DEVICE_ID_VERSION          GENMASK(7, 3)
> >  #define PTN5150_REG_DEVICE_ID_VENDOR           GENMASK(2, 0)
> >
> > +#define PTN5150_POLARITY_CC1                   0x1
> > +#define PTN5150_POLARITY_CC2                   0x2
> > +
> >  #define PTN5150_REG_CC_PORT_ATTACHMENT         GENMASK(4, 2)
> > +#define PTN5150_REG_CC_POLARITY                        GENMASK(1, 0)
> >  #define PTN5150_REG_CC_VBUS_DETECTION          BIT(7)
> >  #define PTN5150_REG_INT_CABLE_ATTACH_MASK      BIT(0)
> >  #define PTN5150_REG_INT_CABLE_DETACH_MASK      BIT(1)
> > @@ -53,6 +58,7 @@ struct ptn5150_info {
> >         int irq;
> >         struct work_struct irq_work;
> >         struct mutex mutex;
> > +       struct typec_switch *orient_sw;
> >         struct usb_role_switch *role_sw;
> >  };
> >
> > @@ -71,6 +77,7 @@ static const struct regmap_config ptn5150_regmap_conf=
ig =3D {
> >
> >  static void ptn5150_check_state(struct ptn5150_info *info)
> >  {
> > +       enum typec_orientation orient =3D TYPEC_ORIENTATION_NONE;
> >         unsigned int port_status, reg_data, vbus;
> >         enum usb_role usb_role =3D USB_ROLE_NONE;
> >         int ret;
> > @@ -81,6 +88,23 @@ static void ptn5150_check_state(struct ptn5150_info =
*info)
> >                 return;
> >         }
> >
> > +       orient =3D FIELD_GET(PTN5150_REG_CC_POLARITY, reg_data);
> > +       switch (orient) {
> > +       case PTN5150_POLARITY_CC1:
> > +               orient =3D TYPEC_ORIENTATION_NORMAL;
> > +               break;
> > +       case PTN5150_POLARITY_CC2:
> > +               orient =3D TYPEC_ORIENTATION_REVERSE;
> > +               break;
> > +       default:
> > +               orient =3D TYPEC_ORIENTATION_NONE;
> > +               break;
> > +       }
> > +
> > +       ret =3D typec_switch_set(info->orient_sw, orient);
> > +       if (ret)
> > +               dev_err(info->dev, "failed to set orientation: %d\n", r=
et);
> > +
> >         port_status =3D FIELD_GET(PTN5150_REG_CC_PORT_ATTACHMENT, reg_d=
ata);
> >
> >         switch (port_status) {
> > @@ -152,6 +176,12 @@ static void ptn5150_irq_work(struct work_struct *w=
ork)
> >                                 dev_err(info->dev,
> >                                         "failed to set none role: %d\n"=
,
> >                                         ret);
> > +
> > +                       ret =3D typec_switch_set(info->orient_sw,
> > +                                              TYPEC_ORIENTATION_NONE);
> > +                       if (ret)
> > +                               dev_err(info->dev,
> > +                                       "failed to set orientation: %d\=
n", ret);
> >                 }
> >         }
> >
> > @@ -219,12 +249,14 @@ static void ptn5150_work_sync_and_put(void *data)
> >
> >         cancel_work_sync(&info->irq_work);
> >         usb_role_switch_put(info->role_sw);
> > +       typec_switch_put(info->orient_sw);
> >  }
> >
> >  static int ptn5150_i2c_probe(struct i2c_client *i2c)
> >  {
> >         struct device *dev =3D &i2c->dev;
> >         struct device_node *np =3D i2c->dev.of_node;
> > +       struct fwnode_handle *connector;
> >         struct ptn5150_info *info;
> >         int ret;
> >
> > @@ -311,6 +343,14 @@ static int ptn5150_i2c_probe(struct i2c_client *i2=
c)
> >         if (ret)
> >                 return -EINVAL;
> >
> > +       connector =3D device_get_named_child_node(dev, "connector");
> > +       if (connector) {
> > +               info->orient_sw =3D fwnode_typec_switch_get(connector);
> > +               if (IS_ERR(info->orient_sw))
> > +                       return dev_err_probe(info->dev, PTR_ERR(info->o=
rient_sw),
> > +                                       "failed to get orientation swit=
ch\n");
> > +       }
> > +
> >         info->role_sw =3D usb_role_switch_get(info->dev);
> >         if (IS_ERR(info->role_sw))
> >                 return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
> > --
> > 2.34.1
> >
> >
>
>
> --
> Best Regards,
> Chanwoo Choi
> Samsung Electronics



--=20
Best Regards,
Chanwoo Choi
Samsung Electronics

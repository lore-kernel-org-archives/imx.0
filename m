Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B211368D5C
	for <imx@lists.linux.dev>; Mon, 22 Jun 2026 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119147; cv=none; b=tdgvuVLWCbKi8mc0TylA3Up29+ML3NesI9TAJECjrtLfn43E4fRfW6YUeHYJcD1BSEulCBzwWxS4RBJxu2W0o8QQokC5AXMk9evjSXlB136lyTx+bxv9mB5uJc8Vsf6RZKw7EM9hIcIlFQztPttJ6IhQmbKTj9XCpRj4ZVW6GjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119147; c=relaxed/simple;
	bh=CRvHUMaPERdvIZaqTgWAAfdNC4myYpz/V1coR8bSrtg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UtzrLq1v65uLEBekRivmm3T3hJRKEticMiGLiFz9uj79jHhaNY6Svv0Tgm2yY5mv+1Npo+xHwF/yZfd9iEwNxJYG1Ucun4mdCjoi9EAkUWyErNkdwwENFcZ8n1wnTTWJpolAycn1qdETz12/SwBa6ZqGM3zy9/wkGnFBmoXpQ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 64BAA200669;
	Mon, 22 Jun 2026 11:05:34 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wbab0-0043kt-13;
	Mon, 22 Jun 2026 11:05:34 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wbab0-000000008iF-0wHT;
	Mon, 22 Jun 2026 11:05:34 +0200
Message-ID: <7ee62b699c5cabb00cd7706ea42573da81c5bc84.camel@pengutronix.de>
Subject: Re: [PATCH v4 2/2] media: i2c: ov5640: Add reset controller support
 with GPIO fallback
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.li@oss.nxp.com>, robby.cai@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Frank.Li@nxp.com, 	s.hauer@pengutronix.de, festevam@gmail.com,
 sebastian.krzyszkowiak@puri.sm, 	slongerbeam@gmail.com,
 sakari.ailus@linux.intel.com, mchehab@kernel.org, 
	kieran.bingham@ideasonboard.com, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 22 Jun 2026 11:05:34 +0200
In-Reply-To: <ajVPzoWVBi1vsqRQ@SMW015318>
References: <20260619100532.3779934-1-robby.cai@oss.nxp.com>
	 <20260619100532.3779934-3-robby.cai@oss.nxp.com>
	 <ajVPzoWVBi1vsqRQ@SMW015318>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fr, 2026-06-19 at 09:18 -0500, Frank Li wrote:
> On Fri, Jun 19, 2026 at 06:05:32PM +0800, robby.cai@oss.nxp.com wrote:
> > [You don't often get email from robby.cai@oss.nxp.com. Learn why this i=
s important at https://aka.ms/LearnAboutSenderIdentification ]
> >=20
> > From: Robby Cai <robby.cai@nxp.com>
> >=20
> > Add support for the reset controller framework by acquiring the reset
> > line using devm_reset_control_get_optional_shared_deasserted(). This
> > allows the driver to handle reset lines provided by a reset controller,
> > including shared ones, while avoiding unbalanced deassert counts.
> >=20
> > Retain support for legacy reset-gpios as a fallback when no reset
> > controller is defined. In that case, request the GPIO and keep it in th=
e
> > deasserted state as the initial configuration.
> >=20
> > This enables the driver to support both reset-controller-backed reset
> > lines and older GPIO-based descriptions while preserving the existing
> > power-up sequencing behavior.
> >=20
> > Signed-off-by: Robby Cai <robby.cai@nxp.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 80 +++++++++++++++++++++++++++++++++-----
> >  1 file changed, 70 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 85ecc23b3587..5e6db8aacb11 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/module.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/reset.h>
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> >  #include <media/v4l2-async.h>
> > @@ -442,6 +443,7 @@ struct ov5640_dev {
> >         u32 xclk_freq;
> >=20
> >         struct regulator_bulk_data supplies[OV5640_NUM_SUPPLIES];
> > +       struct reset_control *reset;
> >         struct gpio_desc *reset_gpio;
> >         struct gpio_desc *pwdn_gpio;
> >         bool   upside_down;
> > @@ -2431,6 +2433,48 @@ static int ov5640_restore_mode(struct ov5640_dev=
 *sensor)
> >         return ov5640_set_framefmt(sensor, &sensor->fmt);
> >  }
> >=20
> > +static int ov5640_get_reset(struct device *dev, struct ov5640_dev *sen=
sor)
> > +{
> > +       /* use deasserted version to avoid unbalanced deassert counts *=
/
> > +       sensor->reset =3D
> > +           devm_reset_control_get_optional_shared_deasserted(dev, NULL=
);
> > +       if (IS_ERR(sensor->reset))
> > +               return dev_err_probe(dev, PTR_ERR(sensor->reset),
> > +                                    "Failed to get reset\n");
> > +       else if (sensor->reset)
> > +               return 0;
> > +
> > +       /*
> > +        * fallback to legacy reset-gpios
> > +        * GPIOD_OUT_HIGH ensures deasserted state for ACTIVE_LOW reset
> > +        */
> > +       sensor->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> > +                                                    GPIOD_OUT_HIGH);
> > +       if (IS_ERR(sensor->reset_gpio))
> > +               return dev_err_probe(dev, PTR_ERR(sensor->reset_gpio),
> > +                                    "Failed to get reset gpio");
>=20
> I think needn't fallback here, NO ABI change, just change to use reset-gp=
io
> driver.

Please keep the gpiod fallback, the reset-gpio driver may not be
available on all platforms using ov5640.

> > +
> > +       return 0;
> > +}
> > +
> > +static int ov5640_reset_assert(struct ov5640_dev *sensor)
> > +{
> > +       if (sensor->reset)
> > +               return reset_control_assert(sensor->reset);
>=20
> needn't check sensor->reset, reset_control_assert() is no ops if NULL.
>=20
> > +
> > +       gpiod_set_value_cansleep(sensor->reset_gpio, 1);
>=20
> Needn't fallback, directly replace.

See above.


regards
Philipp

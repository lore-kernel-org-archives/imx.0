Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379423C06F
	for <imx@lists.linux.dev>; Thu, 30 Nov 2023 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SzsJiaOH"
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 61DA6D8754
	for <imx@lists.linux.dev>; Thu, 30 Nov 2023 10:20:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF88124000B;
	Thu, 30 Nov 2023 10:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701339602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxeX2wy4DYJyBHFFmjfGARbNkbZtBHOZlxHLk2Rp2VQ=;
	b=SzsJiaOHAQP9sp5gZ+zR81XoshHOseb+8oXeDl1RCkHAzNJ68S1q73PKpRl+AoMxS0aHIF
	vq/qJlTVWyE2FPOQdgAV+6fOr2ifbXHP9h7QuzYn/7vxdfz1bA+vFqEd44x9008qz7k9G3
	bpQe3BkalvPYk+j7teQklvpV4k7yLJ5mTwyydgNOxn4A46ZEo8dG/xV8gm0xiGTPUbmTbG
	cS3PZx8fTmgffK6P5UUrzhhOtI3eXJ9A1Xhu8M80vgejYMx7ox4IyEDfmf9PlrCfPJkFHH
	2WUwYsBNAM4L5W1YCRy+X+mDS311DYBfmRIkkpG2eBb+H4WF6CWDVB14qX45QQ==
Date: Thu, 30 Nov 2023 11:19:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 6/6] i3c: add API i3c_dev_gettstatus_format1() to get
 target device status
Message-ID: <20231130111959.11afd8a8@xps-13>
In-Reply-To: <20231129221225.387952-7-Frank.Li@nxp.com>
References: <20231129221225.387952-1-Frank.Li@nxp.com>
	<20231129221225.387952-7-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Frank,

Frank.Li@nxp.com wrote on Wed, 29 Nov 2023 17:12:25 -0500:

> I3C standard 5.1.9.3.15 Get Device Status (GETSTATUS):
> Get request for one I3C Target Device to return its current status.
>=20
> Add API to fetch it with format1.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/device.c       | 24 ++++++++++++++++++++++++
>  drivers/i3c/internals.h    |  1 +
>  drivers/i3c/master.c       | 26 ++++++++++++++++++++++++++
>  include/linux/i3c/device.h |  1 +
>  4 files changed, 52 insertions(+)
>=20
> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> index 1a6a8703dbc3a..aa26cf50ab9c6 100644
> --- a/drivers/i3c/device.c
> +++ b/drivers/i3c/device.c
> @@ -196,6 +196,30 @@ void i3c_device_free_ibi(struct i3c_device *dev)
>  }
>  EXPORT_SYMBOL_GPL(i3c_device_free_ibi);
> =20
> +/**
> + * i3c_device_getstatus_format1() - Get device status with format 1.
> + * @dev: device for which you want to get status.
> + * @status: I3C status format 1
> + *
> + * Return: 0 in case of success, a negative error core otherwise.
> + */
> +int i3c_device_getstatus_format1(struct i3c_device *dev, u16 *status)

I'm not a big fan of the opposition between "i3c_device" and "i3c_dev".
Could we clarify the prefixes?

> +{
> +	int ret =3D -EINVAL;

Init not useful

> +
> +	if (!status)
> +		return -EINVAL;
> +
> +	i3c_bus_normaluse_lock(dev->bus);
> +	if (dev->desc)
> +		ret =3D i3c_dev_getstatus_format1_locked(dev->desc, status);
> +
> +	i3c_bus_normaluse_unlock(dev->bus);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_device_getstatus_format1);

There is no user yet. Maybe this needs to be done in another series?
Same below.

...

> +int i3c_dev_getstatus_format1_locked(struct i3c_dev_desc *dev, u16 *stat=
us)

...

Thanks,
Miqu=C3=A8l

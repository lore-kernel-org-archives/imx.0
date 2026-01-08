Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3533B8D7E
	for <imx@lists.linux.dev>; Thu,  8 Jan 2026 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867239; cv=none; b=dY9zBQ0RCrJzmE/6vNAKr7EOWyoMabfriiV0HYtTXFWcX3+0XiqWRo+q5tNYNvYGH3Hz0p6lNx9fTKembHV7YKb5jYRPQP+mMpSIlyPOASOGSx8ndIYlY2M/JC+FYwC8zAgp6cyeHwWKZ7ZYFJWvpWudajYX5SbyCI9lQOWfGh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867239; c=relaxed/simple;
	bh=NcceqwipxLHqnW2SLk553bX3Nibm3gYRYwZL21IRn0c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=sbDgZidHIqnFPUceM07UkvHm5WsGXhio4ZC86aEBXq2ro5iNLjpPL+tf5WohsPKI48R31e8+7T9rMpqnzU8opZvivgUw+oXR4jIm0bzZdpy4nOJh2QJ6aLnPAlu5iwQJ9cyLFlMpld9qlwPgaHpNxE2EXgih9ufmLM7UEnJTiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZZyzgQ6M; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZZyzgQ6M"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9C5FF4E41FF1;
	Thu,  8 Jan 2026 10:13:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67284606B6;
	Thu,  8 Jan 2026 10:13:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67281103C880E;
	Thu,  8 Jan 2026 11:13:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767867225; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oktYwHpBxwEHcRdG+441TRw1haM/iQZSRwVoxeIKxoE=;
	b=ZZyzgQ6MhWJyRaP/AtUlqfOLAs4SdmGpIbrTgke2e9hMzTVnklegqCUfH8QRCn5O6RABoj
	16WnFZasjj07Z4qzlbvRLkvzc2VVEUrg/PHo/0hVGUvCveJoVMaKNXpF33qlmGO3FehhOf
	k7pfb4T0ys97YT7G8i9diw0OFkt8LkWxEl7ROtseRInXV4+MdbzVUcQO+WCebz50Eut4hk
	N211JQ6oSlZbRFWPNyySKeXJAaetMVLV8ifWRu/QK0qxRKoWEHucX05hpurrxyD91ZMn27
	K3uokXirBg+StnQE60kwcRSzgmtPXJN8KxmDnZ6moWwxpHk0yjZsOiEyjdf8kA==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 11:13:33 +0100
Message-Id: <DFJ4MHZJ1DTL.10AMTN5NW6VGS@bootlin.com>
Subject: Re: [PATCH 5/6] drm/exynos: hdmi: convert to
 of_drm_find_and_get_bridge()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome Brunet"
 <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-5-ef48a517828e@bootlin.com> <20260108-acoustic-groovy-shark-1c6850@houat>
In-Reply-To: <20260108-acoustic-groovy-shark-1c6850@houat>
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime,

On Thu Jan 8, 2026 at 9:14 AM CET, Maxime Ripard wrote:
> On Wed, Jan 07, 2026 at 05:22:03PM +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure i=
t
>> is put when done.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Why can't we use next_bridge for this one?

Because this device is not a bridge, so we have no struct drm_bridge.

>> ---
>>  drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyn=
os/exynos_hdmi.c
>> index 01813e11e6c6..bfcf2fa62fe1 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -1779,7 +1779,7 @@ static int hdmi_bridge_init(struct hdmi_context *h=
data)
>>  		return -EINVAL;
>>  	}
>>
>> -	hdata->bridge =3D of_drm_find_bridge(np);
>> +	hdata->bridge =3D of_drm_find_and_get_bridge(np);
>>  	of_node_put(np);
>>
>>  	if (!hdata->bridge)
>> @@ -2096,6 +2096,8 @@ static void hdmi_remove(struct platform_device *pd=
ev)
>>
>>  	put_device(&hdata->ddc_adpt->dev);
>>
>> +	drm_bridge_put(hdata->bridge);
>> +
>>  	mutex_destroy(&hdata->mutex);
>>  }
>
> Same story than in your part 2 series, it should be dropped in destroy.

hdata->bridge is only used for drm_bridge_attach(), it won't be referenced
after that. So this is safe, unless I'm missing something.

Also as we don't have a struct drm_bridge (as mentioned above) we have no
bridge destroy. We have the encoder destroy, but that will never be called
on bridge hotplug.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9124838B7A4
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143621; cv=none; b=bWIfhiFcadit4cTHEiO8bbblavHzyjpBJBoXey0EDmA5MIVn7IwbnF1uglPPXgnWcP66Ta+QNvCebwpkmDH7Mz4KhexRNFbK+Zg3vQ238oVlhDzXXofK7Sc1zgF0mkc4AoP3N7wIY/YxYjt/cLCCtXB5fJL8Iy0g1FqXuoKHXIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143621; c=relaxed/simple;
	bh=Gzeo6+35sf2DIizSUSy2HXgNcwZy09ThedKswyAh7fo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=p0a553b/AS/r4parCC4/x+Jcq1QtKuLJepfgQxoB6YWCJaOlUWOOY1EzoUgJXUOv/VRnjx7BdRxQer/kDNCP3TWrPyvnneLcgcbheuUpoGkVuqilJVtwzVoioQfrrxKmDQK7vSpS0QndST2jJBWvLm52rO7E1ZhWWhQaFK0W0ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YTUQEjjo; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YTUQEjjo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E9B374E42571;
	Tue, 10 Mar 2026 11:53:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BB31C60002;
	Tue, 10 Mar 2026 11:53:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6F4910369B4A;
	Tue, 10 Mar 2026 12:53:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773143616; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eztoi8jQ9TUtG0hefClztjtueHs8W3LeO3V21Lf0wbE=;
	b=YTUQEjjo1sZ0eBuCN+3hMBAVHbfrr+bvMFZIgLgsnGKl/o3WJ49QYwzXC4PouCAU1ID6N4
	IE4RdDRMWtOfQVuy4gMQNTaFzyAzTXdA112zwyW+Q/7WP3m7e7kvgjxUTlCqPfM2ZBhwn4
	QsuRQL4eXNiIEHqzTTDjRz4CXaUjV+QDbB9B30fy19xjmAGUsDdbqJVq/4t7QpVC/JvquG
	M9X2oxafAAl7gCwa2+//rz8QgRCCXes06A1S1bE78i3e2AajLcvKmYaDCFHenvPSzV4Jj8
	DR85etIjfahcKoT4SrGIQ5fQOw+OOz8VygrrEhnX5n+a6jHEzmrJ8DKWQIjLGw==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 12:53:16 +0100
Message-Id: <DGZ2Y2WR7CO0.1F6FQTIV7XHVA@bootlin.com>
Subject: Re: [PATCH v8 2/9] drm/bridge: fsl-ldb: Get the next non-panel
 bridge
Cc: <dri-devel@lists.freedesktop.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Francesco Valla"
 <francesco@valla.it>, <linux-kernel@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>,
 <imx@lists.linux.dev>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
 <20260304-dcif-upstreaming-v8-2-bec5c047edd4@oss.nxp.com>
 <5edd40f3-f83e-4a1b-99d4-1e595fc0e4cb@nxp.com>
 <DGZ2JZXSL2LC.YT03L1HYSFTT@bootlin.com>
In-Reply-To: <DGZ2JZXSL2LC.YT03L1HYSFTT@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello again,

On Tue Mar 10, 2026 at 12:34 PM CET, Luca Ceresoli wrote:
> Hello Liu, Maxime,
>
> On Fri Mar 6, 2026 at 8:36 AM CET, Liu Ying wrote:
>
>>> @@ -296,9 +295,7 @@ static const struct drm_bridge_funcs funcs =3D {
>>>  static int fsl_ldb_probe(struct platform_device *pdev)
>>>  {
>>>  	struct device *dev =3D &pdev->dev;
>>> -	struct device_node *panel_node;
>>>  	struct device_node *remote1, *remote2;
>>> -	struct drm_panel *panel;
>>>  	struct fsl_ldb *fsl_ldb;
>>>  	int dual_link;
>>>
>>> @@ -321,36 +318,30 @@ static int fsl_ldb_probe(struct platform_device *=
pdev)
>>>  	if (IS_ERR(fsl_ldb->regmap))
>>>  		return PTR_ERR(fsl_ldb->regmap);
>>>
>>> -	/* Locate the remote ports and the panel node */
>>> +	/* Locate the remote ports. */
>>>  	remote1 =3D of_graph_get_remote_node(dev->of_node, 1, 0);
>>>  	remote2 =3D of_graph_get_remote_node(dev->of_node, 2, 0);
>>>  	fsl_ldb->ch0_enabled =3D (remote1 !=3D NULL);
>>>  	fsl_ldb->ch1_enabled =3D (remote2 !=3D NULL);
>>> -	panel_node =3D of_node_get(remote1 ? remote1 : remote2);
>>>  	of_node_put(remote1);
>>>  	of_node_put(remote2);
>>>
>>> -	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
>>> -		of_node_put(panel_node);
>>> -		return dev_err_probe(dev, -ENXIO, "No panel node found");
>>> -	}
>>> +	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
>>> +		return dev_err_probe(dev, -ENXIO, "No next bridge node found");
>>>
>>>  	dev_dbg(dev, "Using %s\n",
>>>  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
>>>  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
>>>
>>> -	panel =3D of_drm_find_panel(panel_node);
>>> -	of_node_put(panel_node);
>>> -	if (IS_ERR(panel))
>>> -		return PTR_ERR(panel);
>>> -
>>>  	if (of_property_present(dev->of_node, "nxp,enable-termination-resisto=
r"))
>>>  		fsl_ldb->use_termination_resistor =3D true;
>>>
>>> -	fsl_ldb->panel_bridge =3D devm_drm_panel_bridge_add(dev, panel);
>>> -	if (IS_ERR(fsl_ldb->panel_bridge))
>>> -		return PTR_ERR(fsl_ldb->panel_bridge);
>>> -
>>> +	fsl_ldb->next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node,
>>> +						      fsl_ldb->ch0_enabled ? 1 : 2,
>>> +						      0);
>>
>> Cc'ing Luca.
>
> Thanks Liu!
>
> @Laurentiu: can you please Cc me on the whole series for future iteration=
s?
> BTW b4 does that by default, you may consider using it, I find it a great
> tool.
>
>> Since commit[1] added next_bridge pointer to struct drm_bridge, can you
>> use that pointer instead of fsl_ldb->next_bridge?
>> This would be similar to how the in-flight imx93-pdfc.c driver[2] does.
>>
>> However, after looking at commit[1] closely, I wonder if we need to call
>> drm_bridge_get() for the next_bridge returned from devm_drm_of_get_bridg=
e()
>> because drm_bridge_put() would be called for the next_bridge when this
>> bridge(the next_bridge's previous bridge) is freed in __drm_bridge_free(=
).
>> @Luca, can you please comment here?  I see your R-b tag on [2] where
>> drm_bridge_get() is not called, does it mean that we don't need to call
>> drm_bridge_get()?
>
> This is tricky because devm_drm_of_get_bridge() is used. As a matter of
> fact, none of the *_of_get_bridge() variants allows proper bridge
> refcounting. This is because they could return either a pointer to a
> panel_bridge they create on the fly, or a pointer to a pre-existing bridg=
e:
> those need different removal actions but the caller does not know which o=
f
> the two got returned.
>
> In other words, the *_of_get_bridge() is broken if bridge hotplug is adde=
d.
>
> Some discussion here [0], it's a bit outdated but I coundn't find a more
> recent one which I think exists.
>
> So, being bridge hotplug not yet supported in the mainline kernel, there =
is
> no visible problem and refcounting does never really come into play, so
> using *_of_get_bridge() is OK. I'm adding my Reviewed-by to patches using
> it just because there is no alternative currently.
>
> I'm working on having correct refcount handling "everywhere" as a
> prerequisite to introducing bridge hotplug (here [1] the steps done and i=
n
> progress). Almost all APIs have been converted but *_of_get_bridge() is t=
he
> final one and as of now not cleanly doable.
>
> Maxime AFAIK has a plan to rework the panel bridge lifetime, which would
> solve this issue at its root. Until that happens, the best we can do is
> just ensure no bridge hotplug happens involving driver which use
> *_of_get_bridge().
>
> I hope this clarifies the situation a bit.
>
> [0] https://lore.kernel.org/lkml/20250227-macho-convivial-tody-cea7dc@hou=
at/
> [1] https://lore.kernel.org/lkml/20260206-drm-bridge-atomic-vs-remove-cle=
ar_and_put-v1-0-6f1a7d03c45f@bootlin.com/

All of that said, afer double checking devm_drm_of_get_bridge() I agree
drm_get_bridge() whoudl be called on the returned pointer when assigning
it:

	next_bridge =3D devm_drm_of_get_bridge(...);
	if (IS_ERR(next_bridge))
	    return (after cleanup acrtions if applicable)
	fsl_ldb->next_bridge =3D drm_get_bridge(next_bridge);

At least this will avoid use-after-free in case the bridge is removed. It
might lead to a memory leak in some cases, not sure, but it's way better
than use-after-free especially as hotplug is not currently supported.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

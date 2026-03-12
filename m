Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD59A3932CA
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333730; cv=none; b=D3kVmO6HfMckFF7lcFYvinX8wCYnSfaZV9uLWLytHIvmkYVPVkRqrko9w6N7CVPolPwy+IjWIANEORE8OsjlRUpX4vCiCpzQP0Haye5AXmVUkf6luAGqUwSLyt/FLwHx2uHLcGuu8xswIOUUApnMUcHFrcj5djbiEUvmD/V1sDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333730; c=relaxed/simple;
	bh=Dnru2orojmNkrv/RLfc/YG3q8++TJoYKXqNovIMFAvA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=pPQTieXSkOAxXG4/AqvnRBhhgQy/HzUmBS5pm5KEG7m/Mv2rDY4Hwn2+XB0nCcnaAsVdjer+8dlEuVtN/gOMtGJd6W8cwJj27ah4FtUXk9gwMjSzNFQhWtcTIbA+WALyinLCBjQ8i7o95XseG5zgLOVTSLYJT53LTbP99Spqwi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FswO7ROd; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FswO7ROd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3CCA31A2E14;
	Thu, 12 Mar 2026 16:42:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 03A3C6001B;
	Thu, 12 Mar 2026 16:42:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3719810369E3A;
	Thu, 12 Mar 2026 17:41:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773333725; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=B0FmF+DsXQX7GOkjZHLkLGAuMKOJtSb12a+vbzhQook=;
	b=FswO7ROdPc4bZ3FXD4JYr3MHBPxofY/AMnw70L6CzfVcXCjar5dW7hRC57P83dRVeJx+pj
	BjPuPR1Af/NkNEK9rOhLZRTb9gdGg3jDtU+eKmhui8hFss66u2UvEtonwU1iIYXaDfJbyj
	yf0l6m2iPSvIdvse2U3VJrigTFfKdPZ+CRVJ4Vmg1dv2QTP8KreuNhCLnD0NiXcSmsuEiC
	75WsxRv05LcBWrDGgUC1Z3gOcRegLK9bG7HCFjWmUdgm2DU9iF+Tb6ou22OIq/9m23PjRC
	lF9MdP3nyeyIYVtshqQerqIqx7/36XmJABnakwd1d8BtHsCYJ8cd2zPWrhrCRg==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 17:41:58 +0100
Message-Id: <DH0YC7M9YFU7.31DSHCPV381WC@bootlin.com>
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Peng Fan" <peng.fan@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>, <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Marco Felsch"
 <m.felsch@pengutronix.de>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de> <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de> <33e09cc9-69bd-468b-8361-b92a50686f74@nxp.com> <DGZ2XYTVUR28.16ITKRM9S2ACV@bootlin.com> <ot5qypkeirkiweicjijholt2hwfpnnfhrcm3d6euqfnupptsab@din4bkq2sh5h> <ccce0f8c-88bf-4cd8-a806-b62049606cfe@nxp.com>
In-Reply-To: <ccce0f8c-88bf-4cd8-a806-b62049606cfe@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Marco, Liu,

On Thu Mar 12, 2026 at 10:15 AM CET, Liu Ying wrote:
> On Wed, Mar 11, 2026 at 08:45:25PM +0100, Marco Felsch wrote:
>> Hi Liu, Luca,
>
> Hi,
>
>>
>> sorry for the delayed response, I was at the EW26.
>
> Np at all, it's good to go out to meet people sometimes :)
>
>>
>> On 26-03-10, Luca Ceresoli wrote:
>>> Hi Liu, Marco,
>>>
>>> On Tue Mar 10, 2026 at 3:57 AM CET, Liu Ying wrote:
>>>> Hi Marco, Luca,
>>>>
>>>> On Tue, Mar 03, 2026 at 11:34:27AM +0100, Marco Felsch wrote:
>>>>
>>>> [...]
>>>>
>>>>> +	next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>>>>> +	if (IS_ERR(next_bridge))
>>>>> +		return dev_err_probe(dev, PTR_ERR(next_bridge),
>>>>> +				     "failed to get next bridge\n");
>>>>> +	pdfc->dev =3D dev;
>>>>> +	pdfc->bridge.of_node =3D dev->of_node;
>>>>> +	pdfc->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
>>>>> +	pdfc->bridge.next_bridge =3D next_bridge;
>>>>
>>>> When I was reviewing another patch[1], I was aware of the necessity of
>>>> calling drm_bridge_get() for next_bridge to balance the next bridge's
>>>> refcount put from __drm_bridge_free() for this bridge.  I'd be good if
>>>> Luca may confirm this is correct.  Sorry for bringing this up late.
>>>
>>> Indeed you have a good point.
>>
>> At which stage did you faced this issue? During driver probe, because of
>> EPROBE_DEFER?
>
> I just want to balance the get/put for the next bridge's refcount by
> calling drm_bridge_get() for next_bridge, as I said above.  There could
> be some way to trigger some particular Use-After-Free issues if you don't
> do that.  I did take some time today to try to trigger UAF, but no luck,
> though I found a potential bug in encoder_bridges_show() and generated a
> fix[1](Cc'ed Marco) when I played with debugfs to read the refcounts.

The whole need for refcounting DRM bridges exists if such bridges can be
removed when other parts of the kernel still have a pointer (=3D a referenc=
e)
to them. This is not the case with current DRM because you cannot remove
some bridges without removing the whole pipeline (card). However I am
working since a long time to suppor hardware where the last part of the
display pipeline is hot-pluggable, causing DRM bridges to be added and
removed at runtime without removal of the initial part of the pipeline
(CRCT, encoder and 0 or more bridges).

See these links for more background info:

 * ELCE 2025:
   - https://www.youtube.com/watch?v=3DC8dEQ4OzMnc
   - https://bootlin.com/pub/conferences/2025/elce/ceresoli-hotplug-status.=
pdf
 * Lots of links in the slides about previous activity
 * LPC 2024 has a general description fo the use case:
   - https://lpc.events/event/18/contributions/1696/

> My idea to trigger UAF is to remove imx_lcdif/imx93_pdfc/simple_panel
> modules when doing pageflips.  Dunno if EPROBE_DEFER may trigger UAF.

Perhaps there is some possible UAF on probe errors or deferrals, but the
typical case is when removing the final part of a pipeline, including 1+
bridges. This was discussed in detail in [0], but here's an excerpt with
the typical UAF scenario with hotplug:

  1. pipeline: encoder --> bridge A --> bridge B --> bridge C
  2. encoder takes a reference to bridge B
     using devm_drm_of_find_bridge() or other means
  3. bridge B takes a next_bridge reference to bridge C
     using devm_drm_of_find_bridge()
  4. encoder calls (bridge B)->foo(), which in turns references
     next_bridge, e.g.:

       b_foo() {
           bar(b->next_bridge);
       }

If bridges B and C are removed, bridge C can be freed but B is still
allocated because the encoder holds a ref. So when step 4 happens, 'b->c'
would be a use-after-free (or NULL deref if b.remove cleared it, which is
just as bad).

[0] https://lore.kernel.org/all/DEH2CVQV21Z2.25PJBAQAKFJSG@bootlin.com/

>> That's the reason for having the local next_bridge variable since I
>> faced with the same issue. In other words this driver is correct and
>> it's on purpose to not assign it directly. Albeit I could/should have
>> added a comment.
>
> What's the issue your faced?  How would using next_bridge variable impact=
?
> Without knowing these info, I presume that you still need to call
> drm_bridge_get() for next_bridge, since it's kind of obvious if you take
> a look at __drm_bridge_free().

Exactly. The idea in a nutshell is: every pointer to a drm_bridge stored
somewhere is a reference to a bridge. So:

 * When you take a reference (=3D you set a pointer to the address of a
   bridge) you need to call drm_bridge_get() to increment the
   refcount.
 * When you clear a reference (set it to NULL) or the pointer becomes
   unreachable (the device goes away, the struct holding it is not
   reachable anymore, etc) you need to call drm_bridge_put() to decrement
   the refcount.

This way the struct drm_bridge (or, typically, the private driver struct
embedding it) will be freed only when the refcount goes to 0, avoiding UAF.

I have been converting most of the accessors returning a drm_bridge pointer
in order to drm_bridge_get() the bridge before returning it. A few random
examples:

 - https://lore.kernel.org/lkml/20250620-drm-bridge-alloc-getput-drm-bridge=
-c-v9-0-ca53372c9a84@bootlin.com/
 - https://lore.kernel.org/lkml/20250709-drm-bridge-alloc-getput-drm_bridge=
_get_prev_bridge-v1-0-34ba6f395aaa@bootlin.com/
 - https://lore.kernel.org/lkml/20260109-drm-bridge-alloc-getput-drm_of_fin=
d_bridge-2-v2-4-8bad3ef90b9f@bootlin.com/

I hope this clarifies the general refcount topic. Now to *_of_get_bridge().

>>> After re-checking devm_drm_of_get_bridge(), as I wrote on the other thr=
ead
>>> you pointed to, you should call drm_bridge_get():
>>>
>>> -	pdfc->bridge.next_bridge =3D next_bridge;
>>> +	pdfc->bridge.next_bridge =3D drm_bridge_get(next_bridge);
>>>
>>> Marco, you can keep my R-by if you resend with just this change.
>>>
>>> Sorry about the confusion here.
>>>
>>> As mention on the other thread, devm_drm_of_get_bridge() is unable to
>>> support bridge hotplug. So it should be deprecated, but as of now there=
 is
>>> no alternative.
>>
>> Sorry I need a bit more context. What's the issue?

The issue with devm_drm_of_get_bridge(MYDEV, ...) (similarly for other
*_of_get_bridge() functions) is it can return one of:

 A) an existing bridge, returned by drm_of_find_panel_or_bridge() in the
    &bridge parameter
 B) a panel_bridge it creates on the fly calling
    devm_drm_panel_bridge_add(MYDEV) based on the panel returned by
    drm_of_find_panel_or_bridge() in the &panel parameter

The caller of devm_drm_of_get_bridge() gets a drm_bridge pointer but
doesn't know whether case A or B happened.

This is not a problem if the entire card is torn down at once because
devm/drmm will take care or the removal. Even easier if the card is not
torn down at all.

Now imagine adding hotplug so you can keep MYDEV present but remove any
bridges after MYDEV and the panel. The devm action added by
devm_drm_of_get_bridge() won't trigger (because MYDEV is not going
away). The caller of devm_drm_of_get_bridge(), i.e. the MYDEV driver,
should remove the panel_bridge in case B but it has no way to know whether
case A or B happened.

So, this is tricky. The good news for you is you're not supposed to fix
it. The *_of_get_bridge() API is just unable to handle hotplug, that will
be fixed at some point. For now just ensure you get a reference for every
bridge pointer you store, and to put it when that reference goes away.

>> How can I trigger the
>> issue?

See the example above.

>> Why is bridge hotplug required at this stage?

Because there is hot-pluggable hardware we want to support, see the ELCE
and even better the LPC links above.

>> Why is only this
>> bridge affecte by the hotplug issue?

It's not only this driver. Hotplug can potentially be used on any hardware,
so I'm working to implement it in a general way in the DRM common code, but
all drviers need to at least do the refcounting on their side. I'm trying
to catch all patches involving bridge pointers and check whether they do
refcounting right. This is just one of many patches I have commented about
in the past months.

I hope this clarified a bit.

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

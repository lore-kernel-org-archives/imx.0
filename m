Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761B21CC898
	for <imx@lists.linux.dev>; Sat, 19 Oct 2024 02:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729305878; cv=none; b=QlsGNd1jx9ce8t7gdXy6SqMcV5NFW29o+Z7B9PtQMOmdA0qCR2Bt7ELx1tzFlSvLw8XDvsVSQ/hyXq10YwoBYNIeLQNKjiGzF4xhhYT+D6eF7dyL07ZsBlewR+RBNp8H6N3Y73LsRsuq9jkpbPSxxp9Ouz08KO7xw1issah9+bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729305878; c=relaxed/simple;
	bh=3Y4rIZqNrh6l40orc03l2GAGIWW2NKOwVZ/4xRp9llM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lh4wefqF6nmpbhp1AYOUgto6C8VA8B9vvs7toVnrl9iUV+6ckGa+pq4mdzU7N62zDNm1GCS7iZat8x589LJjOAyzXwPOEaNSNdEkAC0Xp/ln0fH4JnK8Lq6t7HP8FZQsc+rwomDdlRZKsA+NK1MtPnyyotj9hyOrJFxYESQX7Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VO/8hZ0G; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VO/8hZ0G"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2e41bd08bso32946317b3.2
        for <imx@lists.linux.dev>; Fri, 18 Oct 2024 19:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729305875; x=1729910675; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=miaF/bzpaXxt5iwAcqBRvDZdA63BMI9c1o0s4Dvr9rc=;
        b=VO/8hZ0G5pER/d9FMUZQyHHjjnpD+w5JqeDhua3vJ5HdSeXvD9NM0G1hvvyI9hzfii
         wOv+Nh3aqhzVowFVKa0MI6MFBOKuaepkluPvmjalXxD5fhKU0BoRpCkwPAWwaOqIAL62
         EJv+zx7sCy3YfMtmWKRBfn3u0JTdqpsoVUwoIHK00Eq6LxJnpYgDOZGbEpBQZv4uqA0C
         7mpm7B1VwlpuM3rfFFNYS07jAl/5mPnXVJZXcUX97ABmmpBlSwhyNeDdROaDR43k50AO
         c8CQ79DTtfaVM14fwqtOoU5rJyf1D8xbQdcqFr27v1smNZD1wJSozxUn1Q8m2RpUFPvq
         /VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729305875; x=1729910675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=miaF/bzpaXxt5iwAcqBRvDZdA63BMI9c1o0s4Dvr9rc=;
        b=J/3vR//IKzacfBEvOKESI9PcuLfuHnCrOSbRioOTARu2RhpMt8FxzPwLYU9bqWVozw
         lTRRdm40XqzmYUUudq9xgS3C0Ks1NClzOQCj+BCgNFGKDOBOzbhx+5HsxPTXfg5RbAXl
         vrBruJR72ZfOIXWhGFnJlJxvZuoUyldbHACnip0heHQg0bbvkaqs1LhX0UVL5u8juHap
         F4KqcjHoqROd1qz14Q7AGxuzxEyoIEzoJ8UZs4UThLRpAou2HkQLO3BQrXCbLEAbL2Zd
         l0uod/jp8cLjYUi9/r3bm7Zfs+PeNR/tOIvt0EzEDM5mJZrPTovUODJoAzRhAtyE/JSk
         1BlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpqYYZF9X5LXCKOecdphSQdyFl4rSyeL8cjvKxcfzsaC455h51iphS1+XMHZJ3NzWNp/8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqnbaVOJ3l/LhBdN40GAuJ92Axg3qN/gTTcqSUGI5UzvbS3pE3
	/wRDEENi6qfv7Ln6iyDc/ttkmKRSsiKodFgC/oImoE4TPBj3jR+7grLH5L2O0hsn/SsbKfh5T8M
	qsDMSZV0sDdNPjKbcAAlmRufuZHNPavCWnSr3gA==
X-Google-Smtp-Source: AGHT+IET/AXMNwoRFwVXHuhBACWA9SQCiFexSXwoY0rVTaRw1no0IViR/dKMbVXvof5PtqZm9DbMaQZ30RW3YSLJrLM=
X-Received: by 2002:a05:690c:ecc:b0:65f:a0e5:8324 with SMTP id
 00721157ae682-6e5bf72bf64mr50318227b3.4.1729305875248; Fri, 18 Oct 2024
 19:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241012073543.1388069-1-victor.liu@nxp.com> <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com> <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com> <lcogrc6uztckwwwsuag5tlk5otidmo7rudsl7zshe3wpfot3wc@ziljns5phhfe>
 <d5d62f61-808f-4c40-bc71-4e168baf4b1b@nxp.com>
In-Reply-To: <d5d62f61-808f-4c40-bc71-4e168baf4b1b@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 05:44:23 +0300
Message-ID: <CAA8EJpqcm66+3d6Qi02pjmiBipFeV7dDdY8m=NR2Q=L9EgRVcA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, 
	will@kernel.org, quic_bjorande@quicinc.com, geert+renesas@glider.be, 
	arnd@arndb.de, nfraprado@collabora.com, o.rempel@pengutronix.de, 
	y.moog@phytec.de, marex@denx.de, isaac.scott@ideasonboard.com, 
	biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Oct 2024 at 09:27, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 10/14/2024, Dmitry Baryshkov wrote:
> > On Mon, Oct 14, 2024 at 01:33:44PM +0800, Liu Ying wrote:
> >> On 10/14/2024, Dmitry Baryshkov wrote:
> >>> On Sat, Oct 12, 2024 at 05:14:13PM +0800, Liu Ying wrote:
> >>>> On 10/12/2024, Dmitry Baryshkov wrote:
> >>>>> On Sat, Oct 12, 2024 at 03:35:39PM +0800, Liu Ying wrote:
> >>>>>> Document ITE IT6263 LVDS to HDMI converter.
> >>>>>>
> >>>>>> Product link:
> >>>>>> https://www.ite.com.tw/en/product/cate1/IT6263
> >>>>>>
> >>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>>>>> ---
> >>>>>> v2:
> >>>>>> * Document number of LVDS link data lanes.  (Biju)
> >>>>>> * Simplify ports property by dropping "oneOf".  (Rob)
> >>>>>>
> >>>>>>  .../bindings/display/bridge/ite,it6263.yaml   | 276 ++++++++++++++++++
> >>>>>>  1 file changed, 276 insertions(+)
> >>>>>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..bc2bbec07623
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>>>>> @@ -0,0 +1,276 @@
> >>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>>> +%YAML 1.2
> >>>>>> +---
> >>>>>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> >>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>> +
> >>>>>> +title: ITE IT6263 LVDS to HDMI converter
> >>>>>> +
> >>>>>> +maintainers:
> >>>>>> +  - Liu Ying <victor.liu@nxp.com>
> >>>>>> +
> >>>>>> +description: |
> >>>>>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
> >>>>>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >>>>>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
> >>>>>> +  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
> >>>>>> +  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
> >>>>>> +  1.2 and backward compatible with DVI 1.0 specification.
> >>>>>> +
> >>>>>> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
> >>>>>> +  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
> >>>>>> +  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
> >>>>>> +
> >>>>>> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
> >>>>>> +  provided by the IT6263 in two interfaces: the four I2S input ports or the
> >>>>>> +  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
> >>>>>> +  is supported at up to 768KHz.
> >>>>>> +
> >>>>>> +properties:
> >>>>>
> >>>>> No LVDS data-mapping support?
> >>>>
> >>>> It is enough to document number of LVDS link data lanes
> >>>> because OS should be able to determine the data-mapping
> >>>> by looking at the number and the data-mapping capability
> >>>> of the other side of the LVDS link.
> >>>
> >>> From what I can see, data-mapping is specified on the consumer sink side
> >>> of the LVDS link. This means it should go to the bridge's device node.
> >>
> >> Then, I won't define data-lanes, because data-mapping implies it,
> >> e.g., jeida-24 implies data lanes 0/1/2/3, see lvds-data-mapping.yaml.
> >>
> >> Please let me know which one you prefer.
> >
> > I'd prefer data-mapping.
>
> Before I go ahead to use it, I'd like to get confirmation that
> it'll cover data mapping which supports 30-bit RGB pixel transmission,
> because it is something supported by IT6263 as I mentioned in v1
> dt-binding discussion.  For now, data-mapping only supports jeida-18,
> jeida-24 and vesa-24, see lvds-data-mapping.yaml.  And, I'm not
> sure the 30-bit data mappings specified in IT6263 datasheet are
> standard or not.

It is not. At the time the standards were written, nobody was actually
thinking about the 30bpp panels.

> Note that if we use data-lanes instead, then this is not a concern
> from DT PoV, as data mapping can be inferred by OS.

It can not. There is no way to determine if JEIDA or VESA / SPWG
format is being used if it is not declared.
Moreover, <uapi/linux/media-bus-format.h> doesn't declare 1X7X5
formats. If you are to support 30bpp LVDS, you'd need to define two
corresponding constants, then extend data-mapping definition and code
by documenting 5-lane LVDS as standards extension to support 30bpp
transfers.


-- 
With best wishes
Dmitry

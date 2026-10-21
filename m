Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596615;
	b=Aw8VCZOjU87eIpc1XF/++hAoRszM8JndWBdEo83AERb+4h5fcupfIzcItBEnU/QFW0ic
	 Xf1r+EBHRmgmAiGI5MPUF9g27gEae6Lg+TLfIYAAA6EEMk/J/xHZWihaMdtl8Ezc0NIs+
	 M9lMxIXVx/LKFP2OxdcErCW7Q6OpD3R2EAaQ1ndrGwfppvDWpHvnGA0TUmwk8sa9PUPv+
	 4k6eohAbcJL0T8Dr9tpZ+ROA5Q7nadwfMiDWnyQIqdlQTZ0U1gWPJ8VcmmE0fqmHfjaxp
	 gsKo1u6nfSXq1GPRLQsfS17GcGiPxxW/fcSm0AYwasqsZDkyPfwCw0BbAXNsIezcLWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5CRmc5lAViuSw2eMUXLr8sP6YVEevy9FEYxV4LYZv9k=;
	b=QoBb55pE9hCuIytecmJIq2JYrJLI6AM65yIM3RzDv8l3AvLKqVlYu0Hhs4emrPIkVNiX
	 lFeQFZIYV4/RZ0GKkyu2g4ZWKVNZgBFyJsu1TEm2/14DAZbbTcW+WDwIS+DeS++xS2pOJ
	 PpVpHC02PNGLTLzUDacFjewarIT0702LEGWEwkNQyOiEW5r6xM9mHcbxIg/YGuHvhp9QI
	 wQMdgzASr/490EarZvzNgpCT6UEULqX2OWBHA9weCO/+QadLXIod3srXYIFAmkvzcZssR
	 IiiZiXUEPgnfTWOUAiw6T3fy+9rO2g1Tvr3+/QsH4Eq0lC7n2LeG4Gbdsto6J8KWdCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rcqq5RFp;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D910606A322
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 15:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D910606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rcqq5RFp
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso632146f8f.3
        for <imx@lists.linux.dev>; Wed, 21 Oct 2026 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792596614; x=1793201414; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5CRmc5lAViuSw2eMUXLr8sP6YVEevy9FEYxV4LYZv9k=;
        b=rcqq5RFpH27BgAIPyKaM1z2yk6HzagAEd7fV1Y4ekKHgHDdvcrpdN89/AlzRPQQwuw
         RKt7uSOEcgS3J1hzsfOfeTVnx79tMPDmJ8h32tsQjRnGCUOmLFNYXV0HtK+JLN8Jiis2
         cB/Df+yLZGm6qV94Z1KLZKx02umFlG5w9XpbkzkDyftzX5Y4qcg847kDatlgYoe88pgT
         n1mBsO4Wp0lDZCtCnzAbBgMNkcrj71YFkWxQPLGDZfZoLvV7aLIu7RiJuYR5/KFCtnDT
         XG7MYzCV7JB2HAiAu3A2U4qBGvRqnTmQcEVDi75hcshmzttY3E1o5PVnSI0EA/T6Wggu
         nhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596614; x=1793201414;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CRmc5lAViuSw2eMUXLr8sP6YVEevy9FEYxV4LYZv9k=;
        b=DTc6LQhXruMJY0mSuZQqVqPsUKHTpV4Co3OCeahx4Qc1OBS95yJg9IfQJdEwPSG7h3
         upa7iVIJciSVKNiZRJ/JTv35kbm+ODo88VdjHYIf51J9iuO2HEIi72qJpOf/YNYBXd/U
         VLOrfcxyV+ZoO/E+osRUSZx6imqOc976oNBji4PgqmvERyoPNFKAEQa/I1YpQfyT3FaD
         BNHo0xZHW9blQ/dS/RA2nOAHU1TKRmgHcSZ/yK1Mws4vprSccjp46JBo5+oatPfmrXo2
         EFGAuAl5d3ov2ymBEBNmNGGdUw7GIv+IAvGBI9VpZvxuzpC7cbN5nXttLK5BWKbbUBOD
         5+jA==
X-Forwarded-Encrypted: i=1; AKwUvBzXRORgaqFp1KK+6pwonGEBTmNQJ3quRncgw63WZobX7E/50VYLBVmgRvPleTY2WnyRaEo=@lists.linux.dev
X-Gm-Message-State: AFq9FYJNvb8TkmjJ5X8b2/xgTTA/i2RGC8lvLEl8e8HDzMrda295ziE/
	Qia+qvbjsYRmku3I8p5iKt6b6n1golADVyao9lmKVAEBJrttEtkYDXmi
X-Gm-Gg: AYBFou2ZLVkT7TnoDxxurKHwk61rqdyQMTokt57eg7g2d4716WaLcWxsyF9q4Klp5jw
	HE8jEWEPki3EyRRpb+Roz6rZYTenmOp0flr7USdVDeLKd4Kxk9cGSmhuzVd+o4I71co6XKzNu3g
	w/lkqnInBmpvmKTtI1Akv0W1ap1p4ELKFtqfo5lGjeIOlMVPNoOqcLEUnjqqZtG9Lh07MoMVEsN
	gr99UE1+li3mtGX3hEb77Zmw0OyuA23FPx2yKCGvEjd8LKEYYFAMYG9tZRtQDayY9e09aDq7LeX
	4rECXluHXXM/+tKsq8Y21Woo6SrLB9yo4ReFuKu28YFhWCMlYlhj8qmPr7FlmVe94nAbF+HXZf8
	OMN3vpbOjEUJX/LW7OYcNZO9tJFzbBltYATiDBW89/fQxayR3GKbykpqKrMVsh2oEj6q9RIVKA/
	hueb0UrfRYg8xYlyTerZRjqJASltxGhj347WclRviMmqEIQWNZRfKcD2/cFdsu1kfZRF4b3Xlw5
	H+jFbvs7yHokBMZ2AkumLLdxouXWBSg+2S/OvgrQYgudBDoR3EvulMHdcOgpxfrZSNlO+vPnSV6
	wEpQ6YICRALbbSi0xFc0etDZiZhZTlv7zCQAm7P9h8GfdeZIzWuAi0g=
X-Received: by 2002:a05:6000:1623:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48e264e4b62mr3988627f8f.48.1792596613403;
        Wed, 21 Oct 2026 08:30:13 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm6370102f8f.43.2026.10.21.08.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:30:12 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:30:11 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Message-ID: <6uiccieqybi7rmdpf2bjgfppjdgpzt6sollr2y7ygex4ofssbh@anwfmi6qbyxp>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
 <20261002-prepaid-retired-3d2c9cbc035e@spud>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-prepaid-retired-3d2c9cbc035e@spud>

On Fri, Oct 02, 2026 at 06:05:24PM +0100, Conor Dooley wrote:
> On Thu, Oct 01, 2026 at 01:44:11PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > [...]
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  gpio-map:
> > +    minItems: 1
> > +    maxItems: 4
> > +
> > +  gpio-map-mask:
> > +    items:
> > +      - const: 0xffffffff
> > +      - const: 0
> > +
> > +  gpio-map-pass-thru:
> > +    items:
> > +      - const: 0
> > +      - const: 0xffffffff
> 
> These seem incredibly wide for something with only 4 gpios?
> 
> Thanks,
> Conor.
> 

Hi Conor,

Thanks for the chat at ELC and clarifying what was said here on the
list.

Regarding these masks and their width, they are indeed wide but they
determine what to match against, and we have no reason to match anything
except the exact number.

This was previously shortly discussed here, and clarified by Rob:
https://lore.kernel.org/all/20260918192012.GA1465432-robh@kernel.org/

I'll be sending a v3 of this with only the camera patches soon.

Kind regards,
Ernest


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445528;
	b=rk9GTHPhfhwDXLypntLsBdONVMHs1ssKgETqOkjQcRAlbQ5Uk42xXOXxEYCzztW3PDpc
	 VlOMpNwRT/CJzz2sj+ID6KmeDaLcEvHF1Fz8LXtb6pAdATAVKB1FPS3otV4wQDgvlXde2
	 RXTc8AkoqskK3bTqf5gqpO4u6bw1Ib/fV0i+nXi+WzbtBdJO2XhiEv5WWnp+5arA3mlDO
	 zpHjXJtImlcCgrBcAli0Q6oZijkkmAj0AFl2MYEbLFzWsJWHPxFfC3f0tBAAZhuo+PxYC
	 ZtK1UD0mlpyIC7f/LS7Z1yGQkH6BAT7kPiF7lEHasAL24aklG8h/VCf3jAtqzCKNVxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TuVHoTWOLcCyB9PSRvxtA5wjt2JdJw+LyuZbMuRvoqU=;
	b=QCHHZcLw6aYdSLaP6G2aWCMqHlx8CKpUZcA8ypTyDIE/kJwMNh0wRHFAHf1F6KoUCsEo
	 W+Bw6es0o4vXzspOw/Es4YXGg7npUhbvCMusU0m6cZknELpgN192esbM7b8vD8YmsiA3z
	 Q8KeUhsAuBn22/xgtiDo/YXTixVkcjICRn2wdwmr1farmaHl7QL3RZb7X658Q9FyQ1QfD
	 s1d+zXwZto2ffZ2iEFv4eVMynEOaFrIFPoNQJnwHVl3ysSXHbTMRp79XnOz2s+w/wL51i
	 lbvuoWFlQO8698+SWSBu0jqrjoouu9+/q0/ppRV/rhy8AGG2nbu3KjJhcaco+RbhONg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T5wNMLLS;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111F0606A329
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 21:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 111F0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T5wNMLLS
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6290358eec.1
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 14:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445527; x=1793050327; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TuVHoTWOLcCyB9PSRvxtA5wjt2JdJw+LyuZbMuRvoqU=;
        b=T5wNMLLSHxwEnTvBrFhb62LuUUGxLfIDBJ1y5DH9NVLAnU9LlR3egC0iRmpVRmlpLH
         wo+0aoUUFJEgPQTNpRC+H3GYx/zRCY+GIXLk1/T7hkQhy8C+T9Ko2zzKs7lSJXNUWAJw
         lNlD2wWYbHjTb7h/AefWuqVZcWUfv9RcQfF6wXvVCj6An/LBwYwatESnZgVcl2MQVdMk
         6aygKkLWVcRjhtBqN+KnRrxi73WpzyiAuZeKGCChGZr0Rdlx+nqfieo4kOLJzzdTU3Vq
         jM/fwZ8Z0h69EEA/I5feDx3CPfR+hVM1dBnZqu4x5Q21IS2EI8cMQoWhnSuPY79E3KWV
         nYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445527; x=1793050327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuVHoTWOLcCyB9PSRvxtA5wjt2JdJw+LyuZbMuRvoqU=;
        b=C+uKOW7AxSpDY4BLBoh3k2Zlw5MMxzvyIjyGtaG3z468J53TNzR71Ncfn6nZuz6Ii8
         NlsCxCYyWhhgmPSml9LD+tUsU00laZhnPX+jTjC4ABhx8Q6dJUSm74L348sYa51lDfEj
         9O/8Z3q2eptpIQ3PhuJR83LR7V2IgvhRHbQTmsDPUq2ZO6FgEn54vQaoGf8x0b86awND
         K/q2FnH6EkKm1odCMroNwQCm9eBs5S7N6Cav/bib7E2f5XO/R89tIsY5uY/fP8Yx1RiR
         iLcjTQb8DAXwJ/+AXC7GjC8epxEJY+bjozUQVPO4os0vkSg6CNJRl2S5zPI713o2FzrN
         jMuA==
X-Forwarded-Encrypted: i=1; AKwUvBx5/h91ViTC7EIobqnk8BZS1qgj5eGwjhjwewopjU3wxnPTEDFMzmfxnrSVLPQNrQ7QxDs=@lists.linux.dev
X-Gm-Message-State: AFq9FYJB0K3pfYdNUD+mmT6byvP7ac203dpr4tctxYSuc7fab+cwowYc
	+Nta24mAE6P+uBzwl2qlQbmxvd7WPnIkGOmBIXAra8X1U5PrfJ5Q+6ZP
X-Gm-Gg: AYBFou2yGdH46uf1oIZ96q+7I1wmOQe81GMcTKfUDmmpIIxzZAhlpw+9MtjyDMIFKfC
	/V/xctplnzGQaO6jtg7A0GLMn503MT5S1q511y5XqjDMflehm6QgC3JlAFMu5MYte8cfZzWly75
	s2Bcsrvyn0Ip80WtVok+oBCr/tWmA2ggQ7YptrOgM5GsJo0DPfEtCrk/UxiNwcxzgeicSV5lh+U
	ctCYJHrh/onGv2tcPnWkr9M1zvhEK+8g2zmEAuXNAnOJuqpfjrolKkPmH/TQAPvW5wtqdrqBe5h
	lLOKqorkAYKQ3ueBzfuikZfRisceYUv2hH+gadmp24iMBlBBOuUkPLyv3KZPMR0b3nby7q6CTbh
	NCFVvnd3TAApYMNKR48wZJ4rZa+fP+d8przo3wGZB+JJRYY/mrbzE+mmeVV1pQOMEfUR3yIjSCL
	Y/PG57XNXzhBOjCdmDLLkgyTtw2ZozDYmR0R84sN+DCIbjaK7BVR1IXAdD3+zX5NE0x67jCYmQ+
	rNhl9MmNEvUmYdO+Rr0QpJ/LWhaKSfGngRhrQTF
X-Received: by 2002:a05:693c:87d9:20b0:365:b147:b458 with SMTP id 5a478bee46e88-365b147b492mr1344116eec.3.1792445527063;
        Mon, 19 Oct 2026 14:32:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7c21:7991:4e59:de42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm63920435eec.24.2026.10.19.14.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:32:05 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:32:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Support Opensource <support.opensource@diasemi.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: input: dlg,da9062-onkey: Allow
 wakeup-source property
Message-ID: <ataMRZc7a0y6IUnG@google.com>
References: <20261012210054.2848389-1-Frank.Li@oss.nxp.com>
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
In-Reply-To: <20261012210054.2848389-1-Frank.Li@oss.nxp.com>

On Mon, Oct 12, 2026 at 05:00:53PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Allow wakeup-source property to fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dtb: onkey (dlg,da9063-onkey): 'wakeup-source' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

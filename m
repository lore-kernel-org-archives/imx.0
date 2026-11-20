Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171195;
	b=HHLn3okOoPvgeIwfCTYEfsii9eqr1+1fHXT114MyGMuRbWZakl0Nkj88bBiHh+N8AIKT
	 c4de9xIpgW3n06pI3AWTeC3LCLpGYWLULkEpdV+wr1AJYtX9cNj2mEu5HQgfygakS3Ubc
	 V/O0MPmQdiO4S46AIOKLyd0GGc6/2rBXIOMkUwyAjSYY560U9En+tlkAmvmYoF0df8jPx
	 69sgmbWq+lCSqoMXrmnwQmG5kGOWpuyrszHfNLIYVrE9HRmpZR6XEaKpfc24ZFYC7hXrT
	 6m26DyiYknA1/Ylr1ZM/mNxVY0VsKImjBg4rJaAcvjM/+VisAdd87s4CKKpCHFBW6uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3+VBw69wTrVgO5VPJPDE6AGnWD5/X+T7xbN7bpttQ7A=;
	b=KinQRI7lMjxvNxTIyZq8teq5YLsJ0KuH9wQDBCOuVZF8fTWWS4KPdO7SaZLLDAQuPyMO
	 Ep1ZI4+zcD+C+B7HPvzkp9ieEwv/jNag/fr1O09jEmr4euNzsUTPgEsL6z4/mPV8KQSiY
	 GQbc3a0w6f0kekP5ES9o4Pu67GOPza87m0jVJMLkh9ko44+WbSudeZH+nytWOwmPaFZVx
	 4uT6Awa5BF1cS65cD878h9cfPnl9nrPcXyCyxIH6VgU/7H/ykMv7sU0AaI5g8YYpo7/yC
	 KQw+iDYlAhwMe5ubxxMKwNBdzAe4nGnNF2Ykh9pvrDUe3EdIpJU4v4H1soWAONURxow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkvgYcBE;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE6E606A325
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE6E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkvgYcBE
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso346532a12.2
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 02:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171194; x=1795775994; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+VBw69wTrVgO5VPJPDE6AGnWD5/X+T7xbN7bpttQ7A=;
        b=OkvgYcBEOG7tnQJ+iui9Hd7oUL3Fdp25jf2/MNlSioTxjxtofRw2pd+voAONm0xxW8
         5kkZ2sgVH3yxSU+c+Lfm+h3JigSKbvODN3VeRXCsnxAEe8h89G6ZTWOL1vQ7szmNF8nR
         7nHe/6nlsT7LssXRpFHPQIb3+3w+I45wXydX8g2Qpyhe5iCRtfVMwyrHRKhm7hZlpVGV
         gYOi5awLgrDcJCyiu0A9bY8t+mrPZsguuV3heHrkUFeI0gCuaSeo/+euRWr4gfMmMOk/
         C7M284PyobQSxUzXz5fdCwdUcbH3Ys0MVJngtcpTcZ4fXWMQhd0u5mCDhSrTi1+kCuym
         SWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171194; x=1795775994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+VBw69wTrVgO5VPJPDE6AGnWD5/X+T7xbN7bpttQ7A=;
        b=TygtX6QEusNWGm4gjOVP/AVWmyGxLINeH1klRKww31xJujeFwhLQBG5SXqTc0LSDXv
         aY0048WPwWH4wW5KACu1QgtiUEOZjWNvuOsGRF3W5pGgir54zw9IHmkt50iQDp2hrdtP
         8dmM6J1PaYc/aRmxXzOKqaASCkuSBFu4e4Uot/f0mftsSXJBw+n0XRfY+Qzc7g0EbZ4D
         oA0ELuWZukPde6nPp3SoowpkKihMnsvX0VNWW08aX6KnL+/0CUjme6lz6NAsfjHsCYDX
         GmcNvQV7wqs0ncXNqCVI64C5uvD59VouMwqWENnKkSxOYgZ95eDkvaKSnKZJDqaQY8tQ
         cMTw==
X-Forwarded-Encrypted: i=1; AL+hErH2dJEvYOaoto9PUI5EE+aO/XpBkGS+sEIqhUOnnHocUEc9euduIbK7tFnFVm6yJfj5yWc=@lists.linux.dev
X-Gm-Message-State: APuU4Z+/l1rJaGmSY1zTc6BIlA0vUVP1iLrRELdDjYm0JOTpdkhy9H6X
	2rtDrK9DmoiTAD+vGLXYPNQ22Y9esKf3i01S1jRLYaByis14tvL1MJWh1sKLcw==
X-Gm-Gg: AZFdTZeK280gs6e7ujCkla5Stz/P2Vk+WLNWHtmEWCnlp3dIDhom2j0/DQqEDX40xo1
	GKOJqooDExzwoqeKqiwgZvQ75/WhRJCBerHMIE3nX5fibjpPYQ/vTvvBIOeWN2j8Ps9thVBgI37
	jJHEyz1H6Z1bMTY3RHvJ3SVIiqWyZlvW/BRCY9xTqMvmUmp11MlHUPdTXQClYqvjTM2RB0zucMr
	i3HJKeEc0GNPJRUzeKTjeqO7UjEKDt9xvaS7jSoWpGqH587BxuM++on6y7+XzFACkE7+G5/TJqM
	maaopWNpisiBTS7BGVkZahkqOxI5U5Jy7FR6cvUmvVPLh1SwDUrWaTbeaxPRb0zV08jclYMVy7A
	9OFxu2zpuKoGChTakwBJGa9mRCmJ1fwbEEYWw3OFUQo8iKyMaQm2mJMgX8NhZchqvgFo2Uzeuvv
	k2YjLlpNZJ8Fhj/hTQsEF+ivUHTBCRoCVci9JE7L9UAHs0iFlkO29K/JD44H4ySYNmm85IqZAkO
	rOLzjYhNhkRkYWtxrEmHzbXvG9IUP9+I37b4HebErowi5mbbndm78k0at8wWqCdN5/5ukJTr/TV
	bVIYpIP1quLJPkaRJHPRj7CO2PRmX7iXewjGbaKXF5MZnrhNpTUEji8r91ZwD5+OTjSN8w==
X-Received: by 2002:a17:90b:5109:b0:3b4:e3e:650 with SMTP id 98e67ed59e1d1-3b41c9c40a1mr2219270a91.67.1795171193537;
        Fri, 20 Nov 2026 02:39:53 -0800 (PST)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c13sm3843513a91.14.2026.11.20.02.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:39:53 -0800 (PST)
Message-ID: <47b32f82-cd7e-4bd4-8072-ba859f78c844@gmail.com>
Date: Fri, 20 Nov 2026 18:39:47 +0800
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: imx93-11x11-evk: Add DMIC codec to
 replace dummy codec for micfil
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 daniel.baluta@nxp.com, chancel.liu@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
 <20261120031853.1175454-3-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261120031853.1175454-3-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/2026 11:18 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The "fsl,imx-audio-card" machine driver uses a dummy codec by default
> which does not allow configuring the channel number according to the
> board design. Replace it with a proper "dmic-codec" node configured
> for 4 channels to match the DMIC hardware layout on the i.MX93 11x11
> EVK board.
> 
> Fixes: fcfa86b3e02c ("arm64: dts: imx93-11x11-evk: Add PDM microphone sound card support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu


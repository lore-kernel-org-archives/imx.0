Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494968;
	b=I/kmkA7HuA2lDMawx2uF+y88KS3WEe+16FlEfenFh6VcESAbX3t5CRWE8FfjFIi6KF8A
	 0jS1aj4fEIwD5U4LuW3jBkXA1ouftEmaA9RSdrhUsefhO2CEiVrXGZp5VW3/jwaXMMe05
	 OnWdlNzU2Yn2r8vfw+X3Qx/AObUFDcOFV5B2XvsO41LbprAAAdW4c1Bl79TtTX6h64rYo
	 H/VbLySTaqzpHlN5j7m8NVRbkDL2uZDHiWdXQmL1a1laslYGFxtaY2secIVQ9bk4kPHgG
	 zdsgj6bgtMSbxEpv9qgkJalX41kcahIoGRnwihZXLBq3IEEuZp2AbYgcbu/3D4ohW+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BKNUIkvvRElNLCz/nkWKn3YDTekvBpvFpeCv+ciRNW0=;
	b=e3PySrGCuiNjVVYaQfFjzLBQnyZia5G4G2FAEpoyIwckzBUy7XDDGx6nWwOWM0F45Ujv
	 u0j+6ULxa7mf+32U0Pf00Xe1ySf9B1Q3ofaIaz+3rLg9QKyAMHigf0p9F640Jih/gErfP
	 jJCwE71q5MMDYfbPZGYviWAAHJnGjqWsXjRZMonTaHi+JS9B/fM5NDwGaDAIXdDV8k3os
	 UWfVFsoY951K7kx7+SKxHPRsF09rOUWwIVYMgUXRzyisWke+wzEwacGTLlNRsNOrBCtBk
	 zLP4N7I+PDXn90y/ZB3WpgjSorOqndm+5m5vVAMXQRBg/6XiBRHILOCQMPwxuVzZ8fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ARszXrvJ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DD9606A31D
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 11:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6DD9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ARszXrvJ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-354ba08cfd1so5645276eec.1
        for <imx@lists.linux.dev>; Tue, 20 Oct 2026 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792494967; x=1793099767; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BKNUIkvvRElNLCz/nkWKn3YDTekvBpvFpeCv+ciRNW0=;
        b=ARszXrvJVeC8s9XfKFVQhqkZDwHSuA1Vs3FjrOjUohwPzz+ggwM5e0Th5ABk0YTMef
         kNN9YerXzoQmk9J902JRQZOnmi/SnOaYjTWOnjDwpAXInQYj1wsTdLMuPBOrNPwGvVc7
         pEC7ClQN1l9vPnadSpRbTaDerUCyaVaDEYIKKb4s0JPgL6tq77Aim92u9634B5t8hIgT
         2eRlYz7PIr2y5uIF7Nb2tayxBPemgy1uw4TqMAAeuCyEGqXdVbC6Ns4qShNyR0QxSUte
         1ox+SqBckgmjciioDOS/5RSLLtDRvdgMGUVDgNaGpFGq9kMPkVLQVFJ6VE0vvAcLPbxT
         dN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494967; x=1793099767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKNUIkvvRElNLCz/nkWKn3YDTekvBpvFpeCv+ciRNW0=;
        b=XMil3rfOTonX5rENwPk7OuaHrwccWJi48dZ0e9+FNubLddBagmiBm+jaSZI/Ng5hHR
         ejQzmSVSNGpP9FGZNPnQNF4vNF88eJyysygmvaD05RdVHGZzl/Q614yS16t2a72SZay8
         jjqfzV9Kbv9nJGur93jCTy0sB4D9L/t+otLeBAf29fXMnkf09Xd28Gjpy8MphLMU9+jR
         VnX/9Z0pS3u0PxlxxYAkuY8njldMB2DoVvWjhRJ5Fk30iTPhjiYGT1tEVSDgSrEwFqk0
         VaVPhPy5D4YsE+Lh5zFtzFJRqU3SrzbbupwRnyH4/Irzn4r4hyle/2vsGOC8AV6V5MBP
         wgWA==
X-Forwarded-Encrypted: i=1; AKwUvBxo2kY0m23xByhWybu7j+HpEE083fZBY9qLcu60KOyeIxShRnmHqgNhpX1TB6DDlqFjrKw=@lists.linux.dev
X-Gm-Message-State: AFq9FYLMRaDRTqx3JwPd46RlD+ZLP5rgK6tiLv0GLRvFC3Heec/cosmS
	gjDyeaP/mN6Y93MabXZVU6orKrLKHnWgDwqXgDtVsDdgFLUqSEMCCLHf
X-Gm-Gg: AYBFou15D6z3kvz98+xFG1Sn9cTk67ZmlcRKpEX+zEQ2gcDz/NsK0SCOQ1vkv/ZJueV
	HZjwm3/BI8nb+VMDeEYELVNNU5oQBsPuzr3EDU5bt4NUYAS96QFmJqFkWvpjXxKLqVrrLJCUsyt
	Xf+RMqQOvXHibrPs7x9sbEkJ6FOqEd6sQQhDhhg0uziqOec2MMdIF1Ax4M81Q2SQ1Adr+HkeD0s
	PzHHPKUzavAbVil4Kf78XuupKVxZlcVLThO/NPPJms+JIb6O42tvgQx29liKlQrSKFVyTD1HVtb
	NsW5ZOCxBjjLxMg19ywvxHTIbMuxhlANVOpw3i+NMYnmw6y78UV7KYLfdf+b/c4NLwl7xqax+aT
	KJYgjbkzFUyAQmny1R/0/jQwGh7PdcR3xfU2v/VapKUtHmo9mG4cmtKz/DCdsqgJZd6tOmYdm6t
	3oTmb19yOImIokqUxejsmR5Fh/mmSmPaM4vdwVWp7sFKRtu1+CRw8WAK2Juo3oc5Vv0Gb8yU5sm
	ZbI
X-Received: by 2002:a05:693c:42ca:b0:35b:91da:7cb with SMTP id 5a478bee46e88-361a284198emr14197128eec.35.1792494966059;
        Tue, 20 Oct 2026 04:16:06 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081fa5a6esm41461147eec.16.2026.10.20.04.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:16:05 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:15:57 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: simple-bridge: Support
 data-enable-active endpoint property
Message-ID: <u3zistwpxmtjstw6lqh2qfvr3mrj5ozflxfnrln2qqitjnj6lw@5ea5j3zmonw7>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-2-ef6a3a780472@toradex.com>
 <atZ0jECm5BDeROSI@SMW015318>
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
In-Reply-To: <atZ0jECm5BDeROSI@SMW015318>

On Mon, Oct 19, 2026 at 02:50:36PM -0500, Frank Li wrote:
> On Mon, Oct 19, 2026 at 07:17:15AM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Some simple bridges, such as a resistor ladder DAC, may include a
> > data-enable input that must be driven at a specific polarity.
> >
> > Read the data-enable-active property from the input endpoint and fill
> > the bridge's input bus flags accordingly, so the upstream encoder drives
> > DE with the required polarity. The property is applied only if the
> > bridge doesn't provide its own timings struct.
> >
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Hi Frank,

Sashiko's comment regarding atomic_check was a false positive, but I
wasn't too sure about the one regarding devm_kzalloc. It seemed to make
sense to me, but I'm not too familiar with this subsystem yet. Do you
think this was also a false positive?

Best regards,
Leonardo

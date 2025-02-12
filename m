Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3875B202C32
	for <imx@lists.linux.dev>; Wed, 12 Feb 2025 20:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739393406; cv=none; b=FTaGweP1B2+/iI6b3PbgKl/FXlljbIF1F69z2V8Ktkr61l9NmecJulFyz+XIMNyFDNiZRkgACLloLVXQGNzgLw4M1z7kIMPgAut6SbPhtff517in+e4Svg8SfGeNj8q9o8EpF/RqCgpv3rJ8asvUoEwGozAzVKi1cedAEYPHvDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739393406; c=relaxed/simple;
	bh=7QUo8lq0zOXvMRM2Kkw4Zo86apOpRGfWnw798xZKkyE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gWhRO8An0V3Sv/dnizrDbPuwGW6kA2awQt6RiPujan/I4d7tpcvD23m5EeZ+e+hZGrPioHI6GwjYvp0Cqto4ILKIsJ7Pe49OZ3XPoKAWZ8/8kB6LTTyRqeJNWf8xFfZ2XAmaEflvTOJd4/TtCMe15qYGKmulHxgOFuI1XHCwdlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t3vrPcga; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t3vrPcga"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43938828d02so205675e9.1
        for <imx@lists.linux.dev>; Wed, 12 Feb 2025 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739393402; x=1739998202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05bFiLRqtjieBdQP28ZStS6jjJuxslhK7B+dgz1ufHY=;
        b=t3vrPcga7Hq6M+Kd9RZXa+nh6naakLMlZeVP/lnNbuIanVzYAk1rquTf2s8NYO0NH9
         1x7S7ROLqGefx9UqvTYs5NSt42Ndt3bgVn4KVEkYT8MLM/Vn+9A6iFkklyK0EJrRG7QW
         q93L+NN7iLj1LjyidiQRLwl47T5tCoNAAols8+mSSjwi/zIAhOjb+RfhjzkwX98unJl5
         /FQiaNhisckVZ1NAfVxyfa790infNX1ZSFrdR7u/uzIqia3ogUMVSGni0WarPK+XBPEp
         5iYIhZPak3UQHLvZFNYsA9IgTLN0l2Vqry/NdPGdx7xpXS4D6VlIFH5gNlklFwiw6MkB
         8ulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739393402; x=1739998202;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05bFiLRqtjieBdQP28ZStS6jjJuxslhK7B+dgz1ufHY=;
        b=BOsmJSlyx7yHN+vS9qoFljDXDXTYVHM6eKvcOYqMTNMZnEFnmhyM1CAXEGUjK7WaxQ
         dTF7F8QpfYwsJR00jEHVM5FrhoN9c3OZiMHqQOO4rNKmH+MJYw+rBwCl9gK/uHybmmaK
         UG8iA3iqBgv7Leb2Hfem+b+Rw1JWV6GRJsyllKCOTbD+1eodpolh2yRSR9thq9no9Q2x
         MMYjAm0vIh5WDlid8BE7j+xfqDh+P4hfUB72NW8212Ot/kKNCQIeR6A4NwEhNXELV4Ol
         XZJSQeRQWZP7oVkmhyKms5OhcKtcixU01yY9ceRtuiflnsJK5KOAVhpJvtOguPZxw8fx
         Zg3A==
X-Forwarded-Encrypted: i=1; AJvYcCXROO8nUlYx3TiAmfPr3DgVHyKFf7oeHbX3oLDwJpDYD+4oiaOYx676AmNVHgEeauBDQ7k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3Kp62I/BTgFKiczd6HBDIog08WcKmBTz1IHDoNsXc5/5Mzyex
	DSYFNzyZejJu45LDpFGnUapFc0DeSd8Zr43ue+QW4/A9hiw+Bk81o51M1z2152k=
X-Gm-Gg: ASbGnct8bSlgL7YW4LGW4J3F2eUewWtgzYzwBx8yz2U1D3Xcc6fYLUT042M4bk6ygDU
	jFGsQ/sm1ix43957A21grzULkAJApTSdgRNzaXfe1tZXXb828rXad9+xN11D64h/owp5Za7o2Sa
	agWZ+v5HkfjVGp0neHguTrLWWgpB/BY/1TC+2JNKVNDvdYtqWDetQ+CE33+hKRrvHgkdi4aH5Gm
	LUbGEw/j2rVUDDkJJ3vXt+snAUgE/DqXCDX0Sbf/5yx1gvRqkhLvaxfUb8TDuJYh5S9zuwaajIn
	MCFF5a4UzCS7JpdHs/MUm8L2yNkCYK8=
X-Google-Smtp-Source: AGHT+IEBtbJJPvZYtnqI1EcUYSzvnE3bHzpiZAK+Kj6ubquz7Vmwq6Ph8AWnkEWgLrniziBTqXUdZw==
X-Received: by 2002:a05:600c:5103:b0:439:560f:e7cc with SMTP id 5b1f17b1804b1-439581bfdd8mr18910825e9.6.1739393402471;
        Wed, 12 Feb 2025 12:50:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a056151sm30461495e9.16.2025.02.12.12.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:50:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 imx@lists.linux.dev, loongarch@lists.linux.dev
In-Reply-To: <20240717-anvil-ashy-544e80a1317c@spud>
References: <20240717-anvil-ashy-544e80a1317c@spud>
Subject: Re: (subset) [PATCH v1 0/4] Removal of non-existent DAC nodes
Message-Id: <173939339997.59416.11108011581545463665.b4-ty@linaro.org>
Date: Wed, 12 Feb 2025 21:49:59 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 17 Jul 2024 10:37:52 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Recently I've been getting triggered by abuse of the Rohm dh2228fv
> compatible to get the spidev driver probing in Linux on development
> kits by employees of various silicon vendors (like NXP or my own
> employer). I had a look around the kernel and all users other than the
> original Clearfontz board added by Maxime appear to be similar abuse.
> Drop the non-existent nodes from all of these devices :)
> 
> [...]

Applied, thanks!

[3/4] loongarch: dts: remove non-existent DAC from 2k1000-ref
      https://git.kernel.org/krzk/linux-dt/c/854a080f0b73ff966a813ec2dc53891831daa28d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


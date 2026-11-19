Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080528;
	b=v1ftmRYE4CnZfpNw4g/PzVcV/cGtgI92wrGc4o7HVD1yf1YXOFp8+jldboFsolmpoKi+
	 OvEEiSG3BOefybKSBFvJuZqX4QUycw43JlUx2KLD7ma/pfA23/TxyV2TSI0hzdQeU8KZb
	 7lb9ygmkJB/mwdqeCiLCm8PFdEvZaVf14zYEocuwfgyOIc8sOxCGB1ovue/hIzdsagpdy
	 7MCZBDtXOIsKnRIpqOQtpusgKK4RwYvdlecOBB2+SLUQjpLtpknWfYVuhhug8AJ9+yGHV
	 O1L8n30c+sEU0TleBayS0SklSZJKgYlyfQ0gvEJom8YBgqq4pPbkIVle2VekSgmLAOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tZkUVvzKQjAQWyILkBtC/Saow2IR3GnYSwljO/gw5AM=;
	b=sVdmAXqpkdTzWBHtwGPWPf7Nq+XsE+MdL1r5WKB5mAl6EffQkUjX79Fvr7jJ4BTtQehP
	 AXrYbBYHo0gDvxn/gLFKbEN4cyvNZPfh+fHzwGhoW3/biLZjAVhyoxe+bipR8oDwwUfC5
	 rZy+ngXA4VddymtBbaLcWLfQUGXH7A9KfelOA9D+u78qLQ+7EhiV6gUexmOXEu+lvNoD7
	 qsINdclGgS7RDAKf9osO7Anaq5sHyiU1exn+2HFqwW9Kt8Er4fjEqqJ5uMd0KXluhC+iF
	 e8Uozf9z28icGJtq5etZbfUtGuz07hc7LEc2UPaOxkr/9zEMPo/NbvV6NfsUCLAtoTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bKYtefAz;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6271A60A2603
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6271A60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bKYtefAz
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so17411055e9.2
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795080527; x=1795685327; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tZkUVvzKQjAQWyILkBtC/Saow2IR3GnYSwljO/gw5AM=;
        b=bKYtefAzFxjABQTrSjgOU19eEZJda6PQpCjCj8IyjmLjxNpBqAkcDoJwBxIW3wDNAA
         YFsjd3cNA+HGtpVvRaYNxfr2HMbfUf5VvuT0HcfOLLxGM6AJFajQgAEdulnUPE6dlkOL
         6FkYi+mH6lHfho+zWGwjrfL4ETGNSXNUx97RJlJ47KOTE33IOuAbhUmoyciVcuHJG/qx
         sUUchHGYiSxYjWhLpZwVY6zIxoWIRxjANbho1thOR4rPdYlpeq0RPJO6sOpxMgF5W/yB
         +wJcMIAlplRuaCRLoW1hzsfm+XJ9M7SWc4MWmwHCnXWgTZxTRMcepvBrXfm5tL9jFVp3
         oTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080527; x=1795685327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZkUVvzKQjAQWyILkBtC/Saow2IR3GnYSwljO/gw5AM=;
        b=NEAaWUjKJ6mRvasnF+5s6SeHmVH7Z9JzTqfX7B7GdhbSe/sfJUZO3byfxj8wCNGx4r
         qaosEstLhcih5H1afJqgdMaA9a+BkivwKu6kHjxy17Q2I2ry5OYFMC5pR/PTXZAYzlgA
         v93qA26IbenTCQCfwCk6YgrWELZ45GvG6qhFI+OIsAs5Hes/uTmC0Ar02cU4CGkwaOAu
         r0zqOBzh5OS2x1KX6kzu9T/MK79Grou9fs4kuMQkRUsyCpf6kWeoFcT23PHLnRkdtYCR
         q9pnYdnq2EO2EvIYRFV7J3GxfJO3xRbCOTip/ijhfO4gxIpqMgNvQAoSBBzoovk30Wom
         cOgQ==
X-Forwarded-Encrypted: i=1; AL+hErF/gcZ9LvzxJDPSc+u1BC+dHpKNDUBtqXDSvy/Fq+yHSswE9edtd3etmtzyROWd1ZfsqOk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+9lfPk/6XMUm91BLmjf4yi7AcpWc1VWoHXpDa7HwfsQ7IcKuwu
	W979fAV1hiriB7jYLAeTozJ9+kaGLPDvDSYdK1YHhtUqqe0SYqVshhAO
X-Gm-Gg: AYBFou13FsACDahBNiH+UpQaop3rgee0BI/q7Gy2cy4JFGnWinvICY8B0/4ovGLNu51
	HZiLmcTpJURkOm9l+wKvO0OHcbqmUd37ljkASdj0m/1hGQvw7VBlHyBwVr0c4E3RarO5IBRsoqT
	/No+7XXS+zmCK/cCtzuYY61nnUokLWqEiRp90wBs0ShYNN44HSZtexDh6tzDzge/FvO7COA1EYk
	WHzCLPaXkaxF+qAKsk4dSP93jYtvEMustUVp9vsJwu7M+7jgJhNwPGfdqAm11Bcegng6ecZ4vHk
	1WSfJ0SeQ7pkcdT8vCSmd1uFRqyn/IBQWGgdW66kveOMSVWIuzHKisCKJeKvsp8pGSyQhaKFve6
	EqJ4tMxS3o8dIsrly5HgJAmB+vFZfxo4kpxqLrWPRMQ/KHZLu5aRKQDrlhoFbzJWHbSmDuO6DzH
	zLeRzwL6PqagR2EGHFq244xHeTH80Trqv3OyYzJCjxsy5u4vaxBMlbFrnwqfzGTddh7F/kbAD1V
	vk/djnUJV4QQIqvXtkziEGBXk44sJVBriQu5goXMFcYD4Dyjz4vWlJF65VE7iMG//l/Qrcx6P6p
	CuYUMySszX/EaE7f82MqwFWmNUd0FLX1sDlnIawrDQN1PH7KnBSU1s+VYkHp5arsZeoEQO1oFFG
	B8KYNBEzDqmh9rY8rW8QvsRaf34R4tkyPc8M8pc9y9HVszIgBd5eLBq5lrXLotg==
X-Received: by 2002:a05:600c:4f14:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb7d6cc934mr120234985e9.1.1795080526550;
        Thu, 19 Nov 2026 01:28:46 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm8736002f8f.19.2026.11.19.01.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:28:45 -0800 (PST)
Date: Thu, 19 Nov 2026 10:28:42 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Message-ID: <av7BStmo7w4_rPci@Lord-Beerus.station>
References: <20261119090600.9257-1-stefano.r@variscite.com>
 <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>
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
In-Reply-To: <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>

On Thu, Nov 19, 2026 at 11:18:45AM +0200, Daniel Baluta wrote:
> 
> Use "reserved" instead of "disabled" for all the nodes that need not to probe
> on the Application processor because they are used by the M33 FW.
> 
> Also, instead of disable in the commit message I think it is better to say "reserve".
> 

Hi Daniel,

That makes sense, thank you for your review!

I'll use "reserved" for the peripherals used directly by the Cortex-M
firmware, and keep "disabled" for devices that become unavailable as a
consequence.
For example, Wi-Fi cannot use its reset GPIO because GPIO4 is reserved
for the M33.

Does that match what you had in mind?

Best regards,
Stefano

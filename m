Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620235;
	b=x1Jzq2i76Hl/Wo2Yu4MFZsHauB1wLdDn/PgUr89z+GiYGql+aquZl8elJQbSIKY5u3L9
	 /9T+zD6pT31dBWGRjySESU3phv/DKwcgxtPMW2uWx1bTYgNEyOhxHsuxnglCcTMxLZpbX
	 9+eecjtfx7GmYOxSVuDXkeJAD3Uv8r1YjtV4AN0ROPKQeCZTyAaQWS+q1G4+zUKURWHys
	 /6bDavxuKCzUvoOoaglE58FAokIxNKj4UNeno2ZO5L+jeYBwAKybbexAG1i74xuIOxcjL
	 C8GbMx0ID2+2rM8+ipm17XK8o5cfnQ9t3hHzzah1favbhcS0wWjFxKT2fkZtvimqMyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6EawhG+KLo0QFi1RDOt/xFrv1BkUvSlbwXPxTKgA5RU=;
	b=keBRPZpTLsxbZV4kFyi6d/DLo5sseNH5jhR5elNMx98ROcmh7wpxhHm/fK6WgP8ZBGBT
	 fzVuqoNgN8tl3vsOj87/huPs+A4NMF0MCXXbadmRhA9QsvlOUemJqsjIIMGipXfRjJ2sM
	 vgv/uinH2q53lTw9HqSKldvMxWJTil4EPfglSD/7jMpiiFXIHJFMskLECklcHiGn3gKv+
	 W1Z18o5OzSDwH+/RjjJFB2X+epeJqegSWwbHk/XcJxUuOGFLIfcXABDx1qKzc407uqIm5
	 oXwUzBGamFxcjTgELU8eL6prjPDy6yQkSA3Se5XHOQ7BTcBJ1Gnd/aTwmLZgxLx3jkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOyMxXOX;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C3E606A693
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 15:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96C3E606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOyMxXOX
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so5409335e9.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620234; x=1796225034; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6EawhG+KLo0QFi1RDOt/xFrv1BkUvSlbwXPxTKgA5RU=;
        b=GOyMxXOX/p+N2e7G9/0TdHxLT7yT/SEwzCL6Q+qDoFy8/7NsdduQxvuYxpTL5oU4kh
         VcC8XYqh3sYV4g4TkSO/HwvqMIQnvJlPdA3Sx8PnlZqQ+PqFDsGrXRDAhJkm1SseVfgF
         WeOpccdojexj0tK9oaFKyXTfrug0S/zP+QCg3XD82iHltjMh5vEJojovRQrA6lyYr6jS
         O+MaThQFNqaFfxGhpIInv23pUAyouRAoVaNiHivlb62C9h88ntnH6VyjoWft1ShMdIbW
         wErVmtaXRnmH16PR/EXJuPD6TtPnUzeXfFJ/b3QnrCM7qya+5NW+UovmoB7HF+M3JFHT
         5dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620234; x=1796225034;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EawhG+KLo0QFi1RDOt/xFrv1BkUvSlbwXPxTKgA5RU=;
        b=RN0XfBycGsQWctDU9YwGupyUrdC71WAh1nGs1E38LduPYo8lvu/4/uUO7A3HD0Lc0b
         PzmpxKMFPTCZle3u3z1v3RzzGOoNSsI/+lDpYrGs0mkf9lfU83qPcIj3o0KKfcBIFLsk
         L5J2i64BsfJ3i1KImVR2+sBopBbWg8QlGjbbgatq8lRe2kWtM6TfZVQShgv+paqBCGcw
         rkilcMqrttjcN+xlOvZHzMbwsYfQu9AQkZwxhqNCImqiZMPMLrTxPCMoGxlhSAEBpUz8
         Ju4ZziqgmrhP5EjhiFXjN6cTO5c2Qvjd8ulRs/fqAPsHY7w3DaS/G4nyZYmg830gMw4D
         DL3Q==
X-Forwarded-Encrypted: i=1; AL+hErEqXwx/UvSSdtAARo+4s1HACRmiDnfPmv4TGPGLBhJK2EVv5xw3/rgnXHugolUjqWId1bo=@lists.linux.dev
X-Gm-Message-State: APuU4Z8b5pv1ecWXiMp1mjpvGgb+4SwVw7m6K3VpfeNwNWD+1ZM1Ppgx
	acFRM72sYtAuaz7wsqwBGnGZe5s/7C+Pbe/MzXS5AuywMdbrAq8qw8eN
X-Gm-Gg: AZFdTZceZRJU6HhBaztJqR3eHSW7wgO6xp99reQ1PfFHqpgs8CJP6UlRDEHZucxE7jD
	cfzZfSsXzh3yyZSEJo8cqIiXE2CLFfdI7flEHugoiqiDmWaMVTu9uG6SzqpW2xqf49iyFnWW6Oi
	qhAxPWwR6+Im5/6VQS+AUBCW1JKI0zzjWkoyUty80xrTcxKymjdtk2jNe5eBiopUUX5hUmfwcOU
	8YcPFyq/3ZjkALQrRv+z0BNpFIBBCq8I1m7BopnmpC+Cfu5rLXDJ0YpL00zHABsGC7pYqNU4ycU
	yBq3EN4ToLq1lXo7vuZRCJmFB4FHoOBe3IGZIYburJQJjtvROAShqLAQ62BR16TLlcB/U4PCcJq
	kk6mwgsYYNc19xxS22KfVJvxiLRBfGVDRWk2k8Qku4K17VaYH4kw1fL6+CVYrIzwxqAmJN6aDQ6
	kNmEKPHoh35HyrTfAgb3AglfGjQDnCtPyJ90YxXJvaww+bNxSlL9UJ8rwIyT9fl7svBF0TKgV8I
	kvKCUb93qtHf9Nnd97qdCPJKBsPpsWpK5ZwtLxIQv7+10pe2WVPNgr683UrykIJhzbd5dNjLz3x
	h2BU7/hPbTDfI3lc7hZP
X-Received: by 2002:a05:600c:8210:b0:4bb:7ad8:99f2 with SMTP id 5b1f17b1804b1-4bb88785da4mr344398855e9.0.1795620233772;
        Wed, 25 Nov 2026 07:23:53 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm316515815e9.2.2026.11.25.07.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:23:53 -0800 (PST)
Date: Wed, 25 Nov 2026 17:23:50 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Aksh Garg <a-garg7@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rhys Tumelty <rhys@tumelty.co.uk>, 
	Manikandan K Pillai <mpillai@cadence.com>, "vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Hans Zhang <18255117159@163.com>, Yao Zi <me@ziyao.cc>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 7/8] PCI: cadence: Use phy bulk data api to simplifiy
 the logic
Message-ID: <awb9XRze_e8xt9tA@skbuf>
References: <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-1-inochiama@gmail.com>
 <20261125043639.249525-8-inochiama@gmail.com>
 <20261125043639.249525-8-inochiama@gmail.com>
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
In-Reply-To: <20261125043639.249525-8-inochiama@gmail.com>
 <20261125043639.249525-8-inochiama@gmail.com>

On Wed, Nov 25, 2026 at 12:36:38PM +0800, Inochi Amaoto wrote:
> According the document of cadence PCI controller, it use multiple
> phys for multi-lane setup, so replace the loop of phy operation
> with phy bulk apis.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---

Minor nitpick in commit title: s/simplifiy/simplify/

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

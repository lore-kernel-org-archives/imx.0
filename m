Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297D42135A4
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 13:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933894; cv=none; b=gz8yzyaPV+j7mijz1pZDR7rd0VQyhbhqXuXe1OSY3NKVMw6y2zB0hy8Z3Bt+Q31pcKukMvx8jI9Pq1RQDaQ2SwgB90Ind3Aan4dA4OPDOvIvJG8m+rxFgQXzPODpg6B8k06q9zpS3A73MXFHxsNMFy64DPUttfYXktdx90mWUY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933894; c=relaxed/simple;
	bh=P0u5bKOVeiv3vEYAMFrQC5BmOPXNLg3oQQYCtgr8BSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEyBFmsM7pUBkGY4KHGR+x8tRnBGAW7AGXesyYFN31z3pfE9aYziai6xEHRfnk8O6NGtAdWS05508rayWeTl39W5z/+os+uPACqMduJzEBonGr/V02oOwHfWPcxJ2gXH09bIeUPLk4cWPxLsSIz9JCzQsn1QsCuz3B4d+gb+Xbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7yM4P2R; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7yM4P2R"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so10068091a12.2
        for <imx@lists.linux.dev>; Tue, 29 Apr 2025 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745933891; x=1746538691; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y26J0iAJoKCmJNS38dntVfyxrAVGftlCnn+OgGntO2A=;
        b=h7yM4P2Rqfklev2ccu8TjlwXy4K3NGui44FA+b+FqkHSfcxv+fakjlaPxgfS4ME192
         dmkSliTs+PprzRZ/B1P480FvfHDfVWHv5yJYidd2wUqfAIajjhB+tqvuSDOgZkzBw6hK
         GGlCaCXl4tpVcCOmXpy+U2ECg9yJd5sZJH/p6BSTD0asDiP+cS/XlFD4nRyq3gfvPqAJ
         13dOLIXdizc/nyco4IfNDx9voXOLo42JNR/JZ1PgU5uGZdRyWKc81Dtips3srvdJkaT9
         dVVIsmMKEfhgi+7zyL4lyy+FNyQFdCt3IzvgonAIiyL+KhbMxUATtMv4X8xVJafvgqj2
         uYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745933891; x=1746538691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y26J0iAJoKCmJNS38dntVfyxrAVGftlCnn+OgGntO2A=;
        b=l3PB+qJw3Y+g9j5Ezi+jrr2PY5Er+dmHi1uSM3eKcIISifZGjE98rhb8mjFoWen4EL
         aGoV6zT6NZkJha4zgBCrQ8O820BSs58jQjheexy06t3P6HKT6TPjkJJM3+bjY7kOkL+5
         O/huCsmDTpdp00cDnMomxwXgdzOshb5qFKffzUchHxo/rjrIgS9p8btmeiXdfATztbSp
         3JQ9IOMmuVobIU0peyM1CZ2cXoZ013RyfWHO8wW+6PrnM/Dyj0U/uMGiNRFi3HNdVSEE
         UX24M3KeVfFeRDD1Bncry17cdw+6oVSg1oWZaAilU2IIAjURq11h7bv2x4m0Qr3cYM+g
         e2Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVRnt92BDvccJdzKleInnZjq8NnXGDtPm/GyxeEF4LmEmLw98Og7e3Z5CpD0KdY9byx20o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPKS1alWPGhOIMjrPNX+MRHwA97A8Fn0VTYBkG1bNsZGFHpSLi
	P/GQkGC8mXIdrDevT2vMQeucoIZiqdxuKWOJtlNykMTM1ZRUJ8yC
X-Gm-Gg: ASbGncsIoANcdM+12eK97acfazPyfEW8E5f2RbY5V74ImRlxr2uGFfmmmOhMxmS3NsV
	HZgDHnkd2/NcZEnq92bIhQj0Fx547XbuamgoBh91TO+onjj3QFGcy0mXpKOVR1BX9wqpbfD2ZNK
	q3BZTAo+vXB/uobAqLC8Fn5q9e1w6adFPGBATVtN5aNzVnZ0D/isxvPY358dQDTAjYetVm7nwuh
	TUnFoXi4r5S5lNJfR+jVLFFdC6mGh1Li9wB1o4foNlWHv5fsfQw48EhAK1SN2PWsj7LbCSZMicZ
	izNZXGtljEgq2bZyK8QRYeGDq5QpHnmbFwHcCYYpOCPA8YgxUBEYHhQ=
X-Google-Smtp-Source: AGHT+IECDUUSwqdQe+jFeZC4zccITFBfdZlwb9V2S+BXUJyiLooaUiYpAnL5q+y3JtdKb9LMa4l5/A==
X-Received: by 2002:a17:907:97c9:b0:ace:63b0:6f70 with SMTP id a640c23a62f3a-ace84b71607mr1146290666b.61.1745933891105;
        Tue, 29 Apr 2025 06:38:11 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6ed72826sm778242466b.154.2025.04.29.06.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:38:10 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:37:27 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 6/6] arm64: dts: imx8qm: Add Ethernet aliases
Message-ID: <aBDWF4-63M60EwX9@graute-macos>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
 <20250425-dts-imx-aliases-ethernet-v1-6-15b9d5cca611@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-6-15b9d5cca611@linaro.org>

On 25/04/25, Krzysztof Kozlowski wrote:
> Add Ethernet aliases for predictable names and for firmware or
> bootloader to fill up MAC address.
> 
> Suggested-by: Francesco Dolcini <francesco@dolcini.it>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Oliver Graute <oliver.graute@kococonnector.com>

Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E971D1740
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 12:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034741; cv=none; b=Foqip1j7j4S6hP8xPnc+MCK0XtRsAcE9NrxJ5SQlSj1/FynhmKzOsJXYmxFfgCQz/ouS/l8Wm9LDK7F/mZUe65fHpq5HAjHqVSvQTbcJ/fiq8oy14PtGrd/xejF4iLudv/7Uv1xl5YVE1NRsJMMB4ze+kTQgvS4Z7mDjJk+MRsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034741; c=relaxed/simple;
	bh=ok7x5RJI7Mn1AEexsPqp5C0x7eYorrIzLLTgw98K8jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmVzl/MsqBfM8WfNd5bsXByt8cAOjyYYtZ3VLKDpvsl5+p4wuh4GLTITbt7s/PVeOJHR15uECDKpyPNgRFOt5BUpiuMzob0kLWcSCMdYWRNDJ6c72aH4fBKAPMZlKIZDwEglodOPa1hBt0w2nkLOZroo8DiBxSDEj6lGzCTQBRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiaQxGvn; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiaQxGvn"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2cd2f89825fso1281346a91.1
        for <imx@lists.linux.dev>; Wed, 07 Aug 2024 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723034739; x=1723639539; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ok7x5RJI7Mn1AEexsPqp5C0x7eYorrIzLLTgw98K8jU=;
        b=BiaQxGvn74hy+a6r5SxqkljQARthK7XgEvw7vWF8ZaObkk9Ax9fdm7wcCto3tppYOz
         Inqk8i+9t/pC9NJW0VD/ARiTeUolsvO53tc71rFmbgir+MZHoiRj2N5WXnQ19Pm9lLVv
         8k9TnWhSMhv9EzAxtQXYAleILf0BngAjRxymZABpjfpUEhtXvqmh2/oKQrG7v8ahkaXW
         bw/T1W0Or0h9XDNc4bTF+o+YgwgahhstsLcLi/dFSzf0X/6sM+pxvSvji5ULytMo8/aL
         EvOkotWiR+X3PrmXlX0jogGlrsEvJmAx3UMIiUeJsP5Wc9+L9CqDp/1cFqSJbrYLfsxs
         x3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723034739; x=1723639539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ok7x5RJI7Mn1AEexsPqp5C0x7eYorrIzLLTgw98K8jU=;
        b=J194SZFTgTl6QR8saYTh95aQIugyKaMFsbJdhhYAunWzR8TijULaUW8unhKZQGf7/c
         z/8K9cWPu7xrGGWP1LuBgxY4tKB01rreih6dkZwwng1tpb0nTvzesfGX+YTeUszCwZoI
         5xF0CBM0XQdag/u1eQ0fpEWt6IOvH8VKoUX3ETOS0hc40jVMjc6Ijr3uYh7UTN3dpbqO
         PaiYRVgI1E92nLZATpYjroYVsjn7HUtRwDxeWTs0ndLr187CLapNM50qlAOy2cY7aAYp
         UnpEx2nwTLYm6ca8SySwmVMdnr4faPBz4iiNe6oVBxpdTAqe9KpXVoTHdWVjYeZ2C1fd
         Hcwg==
X-Forwarded-Encrypted: i=1; AJvYcCWmiUUI/Vgna8zs8Dgjs6WYzUwExcffpgeyP1MBSN5asc3BL2eK6qxd/tMKfnq50E38ZIRuUCfuM64t8KDUcTN+ACor
X-Gm-Message-State: AOJu0Yzk0URHq2Yx2gbbe7gqc5Av+OGvVICSVksOKVlDeaOvk0OA+XIR
	M3MZid374bt/S44niXuwTr0+s/0uCPIK5GijjS/7h9JuaQ13tYA3
X-Google-Smtp-Source: AGHT+IEtgc/IfyM1hlCTxxmF58XsYDojlSbPF+RkdeCUdHQ1TcNs1V8jR+Qsv1B284ozMevCienU6A==
X-Received: by 2002:a17:90a:c38a:b0:2cd:b938:770b with SMTP id 98e67ed59e1d1-2cff93c8c07mr16335855a91.5.1723034738709;
        Wed, 07 Aug 2024 05:45:38 -0700 (PDT)
Received: from joaog-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b36d7a12sm1458989a91.25.2024.08.07.05.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:45:38 -0700 (PDT)
Date: Wed, 7 Aug 2024 09:45:32 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	"linux-kernel @ vger . kernel . org" <joao.goncalves@toradex.com>
Subject: Re: [PATCH v1] arm64: dts: imx8mp-verdin: add HDMI audio support
Message-ID: <20240807124532.wcq36oshfce6lfbq@joaog-nb>
References: <20240807112035.236036-1-jpaulo.silvagoncalves@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240807112035.236036-1-jpaulo.silvagoncalves@gmail.com>

Hello all,

There was an issue with my e-mail and the "From:" for the patch is not
correct. Ignore this patch. I will send a v2 with the issue fixed.

Regards,
João Paulo Gonçalves

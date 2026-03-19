Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D463EB7FF
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936046; cv=none; b=a4KWz8MB7BkBpLcWTkOTJSHoDug2U/zOddZ/UckwfFf1FG7EZNY7t1CXjmz2qo+3cuC5bRSvSDQq3D0R8/9cWC3Vakt51Esq8CadMLfRNltMcNXTI5RVtmDuNTL1ghirpMEEw/x1tUbRqXJf91XA0REFx8ZelMPrSgcqw+vCV7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936046; c=relaxed/simple;
	bh=YU4rvkgh97p9odQ7CVIxch+Qex3dGL72dN9hqAFelpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYzc2oTcHtc2+W4MIPuQIUUAvU1rKaJoQSNYjt2POoXzCgHnw2k6RrghcrMFNsWjgqgHlDsy6KmMtRdv9GDdc7DJ34cdsPz+ic8xf/pA0XIUkPS9s3Kw34F53339E8KgjwwQXs69uva+S1e9FtyO1de4R9hvu+/eThtnpvVFmZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmZ3Mrzq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmZ3Mrzq"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b4121c40aso753168f8f.0
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773936044; x=1774540844; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uks/f97JENhrvnsThvZhzUZdvgjh3JvnUSmJzAdelLo=;
        b=CmZ3Mrzq652FYOcpgKAeClreU96gGLt3mcR1bs5rdv/xu2/MXedHd1CbYTQKNCYk0P
         aL7KpQpu8HfvUmYR8tV6wi/TBI/k3xuz8Y57Dkc1PfslRKzRdPxhyKrSo6e5M+AKHe4y
         RW6Flm020wIyWI1QHJZS802bj/y6eX9dMMj9AgfrnyDrUg/nqn9E1MjHawLkEDk9uEgu
         N8I3H2frwnGh0SI0Mbzsv27/LBangTr3YwpX5UOd71mE5ZQzB1t2ZrZxfJgDSuHr55HE
         wkfWmIjItQVttwp+gwdf0BruNC2f2j5Ly4Liw5y1uNe8XWfO8xq/71bLIoQkqsKYRwhF
         joQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773936044; x=1774540844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uks/f97JENhrvnsThvZhzUZdvgjh3JvnUSmJzAdelLo=;
        b=d7T7HuTeQU5Bj5qla1BLEhOZQSP/i8LB5VWQxdtJ05pNxFBUb4ghMWWsc6lTs0Mxzb
         M14sS4SOqMYu+fVG2GqFp/C11heQ8qX8E63Z9lj5DvqbtNCS1HYL6d1KNk3l95x195E1
         HR8VapSl7PhrZRSB2+DNiSGKuLeT+UY0h2/liSq/KWLRXNV5pTVkx9jS4p4WrAJ9YH9z
         656fJs9EjZ1fCoVY5SymOyfXMksw5JKNIiOn+gIfCQJWq/vJy9kMsBX6iJDvAPZgyMdK
         sui8RKGgZbtq2P1hEkPygZwvPHOeZdaTY5ZTQbC/VOB0Md7AnZJCGFFwAbHhLs635yve
         PCbA==
X-Forwarded-Encrypted: i=1; AJvYcCV3IxsJlVXISJmTuptfxqRjwMVga7W6r7UwYI9BVa2AJA7uu0SS9V13w99fhFfsMcFRMYs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuYT9Vr5xqG7jK6JDAQ2wHDm8ECTvHaIHzCUV82zIduOxNHnnl
	dIY3y+JjclLq42vTXZkdGcSDPLSbuZkl8B3RpqG7+bn/ueglWP/JH7xV
X-Gm-Gg: ATEYQzxcIqKjphCqYGvqjVG43RcmT928Qq3O94jA3/GMTI8mkp+EEMQHCbQEMj9eRK2
	lVkHLLJ8nqx3kGZ71/T/YY+DngEd07xyZAXpn5PpkHetkcq46Siycdfko51g7btWqjvPdKo5Hzd
	yeYYPuCRHo6Vhi6BEJgviWTa4ttK1c/VL0cwTk2+c/hu9Godjx5lAtC+VZKCdivREs6iwCfQNQC
	cb4I4gz+JrWYr/71NKoMmOdcGNPwXB30NfLlP6qX5ZtOueQ6i2/vhNLOA4npKx4Venb+WcyJHXk
	GNyl1vjQDe/3g6F225r7yLUVnMZgLvXA2KWgxVmss8DzlrbHzegHZHSDqx1u2r9EuFHIX0sdnRx
	v9ByIdTOPc5DafaMDaZN4GtZf2IVhOmjK410E9L0dVHr+zL5ZuFsnz7QqbcxoJ2QuTx15nL7Pdz
	aG/5ab1rh7Jr+eJSz1J4/GDgxozVdBfh6zXq9DNeA/qEEEWUIF/7TdfX550OIhy5tlqGfmcj7XI
	EfukgxHSbV82YXN1uEAlyV8AOkT3UqYrAKNdVsD7JIG5kQ=
X-Received: by 2002:a5d:5f82:0:b0:43b:45d1:f44f with SMTP id ffacd0b85a97d-43b527c89fbmr14188968f8f.41.1773936043147;
        Thu, 19 Mar 2026 09:00:43 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189964esm16332268f8f.29.2026.03.19.09.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:00:42 -0700 (PDT)
Date: Thu, 19 Mar 2026 17:00:40 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 03/11] arm64: dts: freescale: imx8mm-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <abwdqN23q9Kx4V-D@Lord-Beerus.station>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <24d31e0ca71c9b2dcb64d39117a8501d85cf945f.1772898346.git.stefano.radaelli21@gmail.com>
 <abQzAM1cxsFJoTJ-@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abQzAM1cxsFJoTJ-@lizhi-Precision-Tower-5810>

Hi Frank

On Fri, Mar 13, 2026 at 11:53:36AM -0400, Frank Li wrote:
> On Sat, Mar 07, 2026 at 04:54:39PM +0100, Stefano Radaelli wrote:
> 
> Any enet referent to this gpio node, otherwise can't guarantee device
> probe order, maybe enet driver probe before gpio. rst is critcial signal.
> 

Thanks for pointing this out.

That was just a leftover GPIO hog and not actually used on i.MX8MM.
It will be removed in the next revision.

Best regards,
Stefano

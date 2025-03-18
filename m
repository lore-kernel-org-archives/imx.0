Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BDD20E309
	for <imx@lists.linux.dev>; Tue, 18 Mar 2025 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742308926; cv=none; b=CHaiIjPxgREPZsMGwVN8lE0v75kBZ3sl/+gr7/+cd8aLVLqxsgxE4UNtslSpVUQVxUxw1DthnV5Sqhljj5TLvOqUZLcYzbJD2n7Op00tFSFk52Ny+sxMYHtKtbgtPcubxSWoqhdHEXHt3CPPn0mUKy8PXd9QeOa4KOqlFmjxm2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742308926; c=relaxed/simple;
	bh=m1D3DrSuMH0PruSbFteoGRlHfAZPJmpFXuyq8yrrSZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qo00COigIotJt6S3MHQT1KFM+58oqRx+xUEzURHSjX7qdWF8A/SAUVh8zCu6csxydCCLE2+QnlSz/tFYOjiI3fVtD86LTR6N26tN7mT54ZlVY0AzJ4t1sGD3+Aymph0WqyGIe14K6fjmrRqcuSI4pi6u2yPy2sn16CaGNyIRc8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HW3HWdg1; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HW3HWdg1"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abec8b750ebso1031422566b.0
        for <imx@lists.linux.dev>; Tue, 18 Mar 2025 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742308923; x=1742913723; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zspl3wVIwLYgqNp+ulEkFdZZ5E6KvnR50Qw8FWKSplo=;
        b=HW3HWdg1yxWAAdFtos0HFrQCE5UwtmT5Bqp065AICJZ4t8eQtr1qKRc9YQsi+NgCYW
         R7aevysTRF7d7Rlc6Tlp0iBKlIanWR80CmdYgFLuBZkpZcCEC5bKStiexrEEgYU/Pk77
         yV/VcWSgZwVtKP8BEtcro8JqWCsCXhw37PLCfAXdMX9Eyny7sWp4EzvMpMMBmzj5KW0a
         delSlx6yM+09f8oTNTwPNSlN+vdJMJ+8d4TTsm6jZS2ynYwGOAkFDiLFypLUI9EfcUjT
         Tiva/md9Q9i20LArTMuqGdS1L86b9kRh89alQFQkUeF7Yy7eeOO3YKMPvHvaAeTXaCiA
         /HhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308923; x=1742913723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zspl3wVIwLYgqNp+ulEkFdZZ5E6KvnR50Qw8FWKSplo=;
        b=REb7/05zb2V/B6kVxALn5sP52qz6IkllPQg9djKtp47AlrR5Uh+qXcO01QHQldN/Cu
         AtRHloNXsL2E0OFaMTt64UyWjpOWOM7Hvl9NcNfs4GxytZ0BF5DZ8/rW+Op6tLQXcftk
         ncehDK1t/AbeKVSmTUOMzDfKrhOPAw9emm20h6M2+z8XSzbg/uXaFHFJcXd2fiQ34YMl
         ikaLjYvCUWXuynWoFtwy+7LSFHI1eORGn1m6cUb7dD0Lw1OnYbT4ebDr2jwql/52JMs2
         4fBq82bkQbr8fHHra9y915pvKimskPHZSDHRiBWQf4jvDy4dGoh68UiyYhneIcZ9cmYT
         f4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXGkfY6iFaOzvcAds6b2maKjqT6isrgWreP7kt9lSnoVtxHBz1D9REcQ9lZ5l8EmvBDxhI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyR/h7tAsIYoPtNvY3aYtlBFSsT0zs8QyshGhZg6QZEEJMnHgpt
	sgOyOX5wE05OxjkLAlwCArjQbjQD4z2gP9tkVRb23XIReqEUzIuP
X-Gm-Gg: ASbGnctqTxmHql7hg+DPEJ2RCbO6rVHQfbXLtvZ98jluauF6X597BWE8ZdIIeP95w4Y
	9QPrxzITI0mSUA1xcoHU0vHNFKpmNMvnjq7pcJlRjcrED2XsdFIl+nKX4HZ0LYxazDnh9mG2fli
	nlGaIZWbXsLSoFLRp4jKc16oQIuPpB94zE6dfb/a5DpWvDI0E9Gn058L3hrHarwUQ9GZksePBGI
	JJUdxr7QcKQsWtRUxkYsHkfdifx+Vy1Ztyz558c9/tgyYRgyHePkrxOzRfR/4wMx7MdS1a8zgJf
	HCNbcSHlNkvRRivy0zxpu4c8Kaos2kAsUKU/4dhzODMhpWY8X/6DzXrIsXVLpw3851lhMR2qQ8S
	TL30icrQXx0GHGSBKKvD/U6w2T3rVkncUaM2jcsNhqGMf9A==
X-Google-Smtp-Source: AGHT+IH+JBVpBEJjBQE3T9bMDFZsvcfOx0v4Sq5kpGyqCVHUlHEPiHyf4bAVLVQeD76GwckPOycJng==
X-Received: by 2002:a17:907:d22:b0:abf:607b:d0d with SMTP id a640c23a62f3a-ac38d3fa372mr443830866b.16.1742308922125;
        Tue, 18 Mar 2025 07:42:02 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-95-251-108-181.retail.telecomitalia.it. [95.251.108.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81697509csm7722106a12.30.2025.03.18.07.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:42:01 -0700 (PDT)
Date: Tue, 18 Mar 2025 15:41:59 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH resend v3 1/1] arm64: dts: imx93: add ddr edac support
Message-ID: <Z9mGNxfcquaYW0P0@alb3rt0-ThinkPad-P15-Gen-1>
References: <20250225192159.2907320-1-Frank.Li@nxp.com>
 <Z8+mcZw9yjOr3m/y@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8+mcZw9yjOr3m/y@dragon>

On Tue, Mar 11, 2025 at 10:56:49AM +0800, Shawn Guo wrote:
> On Tue, Feb 25, 2025 at 02:21:58PM -0500, Frank Li wrote:
> > Add ddr edac support for imx93.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Applied, thanks!
> 
> 
Reviewed-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Tested-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>

Thanks,
Alberto

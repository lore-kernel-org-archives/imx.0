Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB1E2E5B08
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751992463; cv=none; b=GtO3knQRQNSD2tkssYQNGEChILZuZLkbps/RPecA38cH8gV21x19oMkmabCSeRTJbJSDyHt4hV/d2wngkh1o6XV0ZlqZ4CYVwyjyjS7+RMR/7/Yxm6oGmo5MgA7C8Joyqw28V2hZRgGpY5kmbgJFlq+XVOtC6bEKNoxGVzjknCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751992463; c=relaxed/simple;
	bh=egjXBQIDVMcPJrFuesqfHI+sAnZEJZw1CswxrACs2UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0rgFO0IB8f7Knz+CONKYfSUnBVHtEnX7eIe/KkG0edLLHdXhY/CznEXbl61dJB3pjS7QTsKpQPx4Q2sTMVjaXj56GZv5RNicr8kdGxd0nDfzi0A15pP9VDFCwCxqPFz811Pveo09GCWHrD8d+/et7amNSUQcr9t1KHsPf+g2SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YhJZSOg1; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YhJZSOg1"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso980968966b.2
        for <imx@lists.linux.dev>; Tue, 08 Jul 2025 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751992460; x=1752597260; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r0at4FacdZ6pma9HH5OGwEa8HPAQDJiRPxVtv3dm2mI=;
        b=YhJZSOg1NTnDf7vNwqrvc9m2lrrhiQg705YLk0MHCm7/1PKlAMDCiP7/VkeOPv9cQq
         yOIttph0EsVoIOt58+hf5GAotXG9YrGgKK+2Ydafz3zOowRKjoe7wjCBc2X64bLoRAKe
         w/0sAeiM2w6r00xd70zDaTOdloNLsztGj6TuvMwmQvlaUWBr/TnkZTtQShXfIErHSKTA
         3hLhx0PQQChMkBxgeSNoVOMUCPxhPyMeMHvAgQMbbqSf+08Ybp53w/y1sJFQzQC0WYxc
         pjWDLnMZjIJVAQAKv4H7lx+76oAkhNg/bpvX31jti5RT8pbjGOaPQZhNNZACG+eTgcgv
         Od3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992460; x=1752597260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0at4FacdZ6pma9HH5OGwEa8HPAQDJiRPxVtv3dm2mI=;
        b=VIC4gqPTkiktWlNXnzxL5UZDlnNJ/Kmq84ieQU4DsGvf5r3qym+t85xw/81RPAbq8a
         IbaeCR9y5H5WqSf72J36W39b+u2Tge+oyiPXxQXyjZteoVGgqfmWyp7gZ9OhiRJFdMrz
         Giw12G+LpeaHD+MOl1K1otwcgynLS25CMSyflN067rdSv8R/kREHYreSlkVI0D2v7wra
         Rd39jaOz9qH8WJf83i3dcMzYoYgnbQpb7eF44qjHZnZvv6y63Yerttk9y0ErQaWp0iz+
         e7d7H9Lm4QqdFW4JBrc2XQx0xONRZk6AVHwkkXd8as+DwSKyJEtKQZROjj5DoCR2dm/K
         HBiw==
X-Forwarded-Encrypted: i=1; AJvYcCUeMvLFEXrGR0JP2uRsFPPu4XWP2uA6acvPqdPir/vlC/4Sphme6FVAN4N5tqcgQSyZjrw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9BUVfEABJLa0ap5Y+JDrKCmevROR3Kc38Bw3leM9Tur95FH0K
	BCpgi67N2sdioaPBHeTXsG7uLeyx74xp1wyos6gb88XfKNEJmICeGrSKLOxG4TbYuwk=
X-Gm-Gg: ASbGncuh/nAkwIVutuHMuiiPSeZXIZwGfNWvT3AiSlhgXvlI+PG7zkWYK1WAQazEi1K
	7lLHVlE8u47LKVcYFihJR19FvqNmuriFOXvT01o9Dw9SfRsgsXqlB3U7ziWiYiYpMfQZwFvcsGw
	Eb2XQjVwccW0+cRJXdQVLPoBsC+i4c0sn8mfuj3ZmNKvfDFJ/xEYxlI4L5VoKACS1gGi0HlcWt3
	m1rJemB3sP4KigRarWcKnjyrS2hv+/E+RNXJSV/RnHrOyfVg6nFKzfiftdofJ9c+koQ5K6YYP82
	CburC9da0Xlncu2jmwKSCo3jEtH5hjIcI+JjdvKF0LEdOwyrthwmuxhPMOY=
X-Google-Smtp-Source: AGHT+IGKBE0r3i/OgmjaRqVmGAN5LyHLg8zBEZZguDeNMFqqfCLNiGPwn8x/2LgZv96cHHN089ljmg==
X-Received: by 2002:a17:907:9496:b0:ade:422d:3168 with SMTP id a640c23a62f3a-ae3fe6fa77cmr1690286466b.37.1751992459765;
        Tue, 08 Jul 2025 09:34:19 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1effsm934223466b.175.2025.07.08.09.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:34:18 -0700 (PDT)
Date: Tue, 8 Jul 2025 19:34:17 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] MAINTAINERS: Update i.MX Clock Entry
Message-ID: <aG1IiVXZSl+/4+Xg@linaro.org>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
 <20250707-imx95-blk-ctl-7-1-v3-5-c1b676ec13be@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-5-c1b676ec13be@nxp.com>

On 25-07-07 10:24:41, Peng Fan wrote:
> Update file match pattern to include nxp,imx* and fsl,imx*.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

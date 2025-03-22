Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C06818D
	for <imx@lists.linux.dev>; Sat, 22 Mar 2025 00:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742602040; cv=none; b=Kw0zwtBoQkK//2ARpp7ZSRRGROd86zh0RdELarIv690uzBUspqySLM/ThD3tiWp47CaxCJJ4obMNV4TD+LeMntUxTEoWyh+k3yCHRyUJiDP6kUmEGGKHoEPhcYnkajYa5MkAfY9Z7lc8RVUy1e9r0drf8mNqsTCGV2CYbVtRb4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742602040; c=relaxed/simple;
	bh=IyTr/qxq70y0NomvKD2q60Aknv/nHZB22ed0liyrWgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfKFilDxgbrGp3vucAN4RcJbQ0eTQPfvFI08L8uyURJrVYcqVMmbhAZw6fD3uUHuZB6PtsTcOn6XmovWdc6cDiOWx5ggGhd6UkRbEPXka2X7K1jBctqG0xw/OaGDse+ZVkYN3GvL5qpZmplhXsbzv7f2eBkcs8msAUeDWlki6pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8TbMq44; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8TbMq44"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22438c356c8so51631065ad.1
        for <imx@lists.linux.dev>; Fri, 21 Mar 2025 17:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742602038; x=1743206838; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEnr4izKJdjnJbBtyeXqqfyvYG+/M2XCUVon+4GL2NU=;
        b=V8TbMq44mQxDCbc2lhz/kNdCa0qwDUE7T0ooHo3WWchRNUJN+ttTZA5GF7RF981SPo
         W+xupAF5VspyPGNm6vQQJ6VETiBy+PqhO0IyAMvLRV31r9m+iAy9soj8ESYlrS/30+zK
         S5ZdnFZjJw9G14IeEZojvP3CU32WGPR18d0v7dKaPBtHDsPT6R+R83VZaDSRmdAoNf7i
         wBFNNViy1Tib8Lw/mT7Rt5tWVv/d4C2lGTmWomMsmqoSLeg/bjH1OJCkHmLq2TTzPTHW
         HUjJolhE8KTEjv1JFxbKG6dvE0Zt//efkDcokebYfHcxuJE7gCHgNO8YWmuV0ZD89M3W
         lqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742602038; x=1743206838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEnr4izKJdjnJbBtyeXqqfyvYG+/M2XCUVon+4GL2NU=;
        b=WvQEJFAvB6gb1reL+cmyxrowWNyVFu0DlXDuMiWyNyd6QoR7ZOCxmGia/G0m3kWIs6
         eUy/nsLCB5xgdirn/joGpIlXgt5I8wmvBfyH/2DMN6QpRktkbrMc0sMl6IopXrD0csu3
         KvftNUy4cCX39Hp7Gj1GPZLggTpVBdGKLNFNRbkn970PEm4+KCGMOhMGxii0JDDopZoW
         D/rbCFyeIOF76jcknXDzV5JZmdX+s877SxeTEHTNMzYG+84qRMDw6LrvW6H5JbyU+I/t
         aCyPS4a9w8q2kA1/iS3KGXT7/BZL0NyH92EMiC5MeBZ+jV323xgCIpNvOvrPGWliYkct
         BBXg==
X-Forwarded-Encrypted: i=1; AJvYcCXjwlcZvix1GnoZtFbrX4VTl1APoEWfRCrNl3JBaMbfGOIcbB4nbGyOuMeVTkUubvgBUmo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo8AQNc835v3A+GdRJnL5Ztu+Efqjea+xFtXC4aFNP/BfUWY+0
	dmeR+nAJRBuE5qf50i0hIxJ3dbDo72qWUwSWyUXBGFs607LX8ABH
X-Gm-Gg: ASbGnctTcDoVoHfB3iAu76UFFaQ0rlnzK3lJ+gwGnoRUQTcw2ztWEIVHnl0ojIwfq63
	p/B2BQ5UU7Dz2UOMlqxQ/A7Cgvz1S1ZAAMecdXwlxdL3Qn9HEZW5z9FUYqX5C2c6ENsO4prqtrU
	8lMLOs/oByzjm30tWa7bMWHI+HivWO9Jjh1G/jnZcESl3a2iP5KcWUeIDLzrNXMlj0lVvlTdiS2
	ImNvxkWkhrsBQ9DZ07pnnuRRmmlvPzuIdTxuW4m+9VhBinBRHEpVbICBA8/aMHp+v9snAfcNQ/I
	yZntUliLCkbrUW/txyRNgHF4ImidDyroIuV8IiOjY0G0oRAgh2fz9XXqs/AUSBQCgfXQ
X-Google-Smtp-Source: AGHT+IFDUMil8h2USTF/6GZ8khOOE0OmSkPrtNpa2p2cNYAZZHsrUMdhozVcZR9tPdXtRiTCt389Hw==
X-Received: by 2002:a17:903:40cb:b0:215:b75f:a1cb with SMTP id d9443c01a7336-22780c5570dmr79779235ad.9.1742602037520;
        Fri, 21 Mar 2025 17:07:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811daa38sm23847405ad.195.2025.03.21.17.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 17:07:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Mar 2025 17:07:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 2/3] hwmon: emc2305: Add OF support
Message-ID: <b1dcabc3-0bc8-402d-9b28-8bb561d489d2@roeck-us.net>
References: <20250321143308.4008623-1-florin.leotescu@oss.nxp.com>
 <20250321143308.4008623-3-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321143308.4008623-3-florin.leotescu@oss.nxp.com>

On Fri, Mar 21, 2025 at 04:33:07PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Introduce OF support for Microchip emc2305 pwm fan controller.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied.

Thanks,
Guenter

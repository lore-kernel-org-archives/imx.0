Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE7014A4C7
	for <imx@lists.linux.dev>; Tue, 25 Jun 2024 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719318822; cv=none; b=iiKefqREEz112HyhEdN9fWeNdA7a2oF6b+WUxTTwMwJBxwgL//vMU8ymckJsKsxgZ/f9YfozExQ5l7BXjCgmazvv/1ebrVIaOG009DkEWC04J3s1dLnT1fYcSkUfdT7WL75kqwB+r87zXR0dnMgfBUWQL6FFwO66XNtQptdTqwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719318822; c=relaxed/simple;
	bh=ouDgNAhiOJABtZd0VRBjqm8wBra3HObZGuom3w81Y08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJnPyS4p5t/OH3RMwZyqluvRiuNCEnDiqt9A+nLlW/eHIp53+JuQfXjaEiDFG7ZgRDz/f6gV42YmEviy0cJ9alFpnOsmHOuzcIx4BAvecwa8G9UPnL/fJeF4NF81Pw/jZwNWAYlDvI9NwnSP7J1Oz9SzFG+q2KG5+T8eppHvNzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APmHJ46k; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APmHJ46k"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-421b9068274so47594365e9.1
        for <imx@lists.linux.dev>; Tue, 25 Jun 2024 05:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318819; x=1719923619; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S/11/hyoYBdDR9OuAjcDpX5M0LFu3VP2tezkbOpybB0=;
        b=APmHJ46kdpMHnBgZtmBsog0nuepv5MTkFY/JYxyXJnCQnT/hpNrAvOmjsqhgKYmvpt
         opMKqPd75bCRdz9kvg0RVix5JGakChrHkHeekroZTehFunrj9wr8ELX7Uoz/yLPGMgf+
         /c+SvbVE6HzCqIUuHL1cZGVf3FaCvPuBxKfBd6m4hE8borVnCjBva57/M6BUHYOu2CfO
         Sep1VuDLc8htd10Y854ZcsoIg71l5YwOXiXhCoxJmtxsogFKjhuFiXfs1mYn5XFHW3pE
         0vIJehd90op6BRrxK6dblqPUM5sk4jF6uSUrKCIk4alAIBLRtQ8PBIVSHAaUDTH89U0d
         MvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318819; x=1719923619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/11/hyoYBdDR9OuAjcDpX5M0LFu3VP2tezkbOpybB0=;
        b=ot2WeHM3Td6pH2tuq9R5a8+9ZXMe+b4O1ivmrguG7vgwQE0QDP8nVpXcnF5Ndh3ll4
         Z0q9G5uEa/A5FKJ5vjRThdlkqfjscvcFVNnjGLfNY1UGqGetAVHnv/JuMnMxfJOq0D2y
         I8qokjLnjb9SQ4y00KoKi2yF00WRyyJsAjharOxxpNW8NzBnhpzxBsG5OwrJl6U7UZ6g
         GL/eThIyjR9ZGNJ5sbaMEa/7AD70dfg//AZ8k3DvEow5F69HjaZHlz6j9pH1w9S6DOmc
         rFJcjcowxsvcz72WkNCvw+X9/OY3jodrdC2faydJsCOGCBRpvYkSMQxzN9wRsgFrNKN7
         BADw==
X-Forwarded-Encrypted: i=1; AJvYcCUOY75OFyNmTRQnshnQjAGqARuyrjVNCptF7getRlfrl7YpzUTsjQFSH+Sx7JV6EgCY/Ig2093TMFSFHI8e5LO4ffSX
X-Gm-Message-State: AOJu0YzxdsN82E9beNpY36Zt2knKi0xSFJjWdR2/7JZjXWjc3p8vfoql
	pQK1AZKw8owzlckIn7AzeZ/nwJ7GRRiBHVZgjEYH6HCptON/gTBd
X-Google-Smtp-Source: AGHT+IHhnOnIodnFCxeYBhMXVK0if3VnPi/+2mhZS3e9FrCXnLgJcv5hamzattUDgvVdgPK7NBoyEw==
X-Received: by 2002:a05:600c:6dd3:b0:421:ad42:c4c2 with SMTP id 5b1f17b1804b1-4248b9575famr56722695e9.10.1719318819162;
        Tue, 25 Jun 2024 05:33:39 -0700 (PDT)
Received: from skbuf ([188.25.55.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d21243esm213969425e9.43.2024.06.25.05.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:33:38 -0700 (PDT)
Date: Tue, 25 Jun 2024 15:33:36 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Kuldeep Singh <kuldeep.singh@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v4 2/3] spi: dt-bindings: fsl-dspi: Convert to yaml format
Message-ID: <20240625123336.7ofgzasbwczdaask@skbuf>
References: <20240624-ls_qspi-v4-0-3d1c6f5005bf@nxp.com>
 <20240624-ls_qspi-v4-0-3d1c6f5005bf@nxp.com>
 <20240624-ls_qspi-v4-2-3d1c6f5005bf@nxp.com>
 <20240624-ls_qspi-v4-2-3d1c6f5005bf@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-ls_qspi-v4-2-3d1c6f5005bf@nxp.com>
 <20240624-ls_qspi-v4-2-3d1c6f5005bf@nxp.com>

On Mon, Jun 24, 2024 at 02:55:28PM -0400, Frank Li wrote:
> Convert dt-binding spi-fsl-dspi.txt to yaml format.
> Use part Vladimir Oltean's work at of
> https://lore.kernel.org/linux-spi/20221111224651.577729-1-vladimir.oltean@nxp.com/
> 
> Additional changes during convert:
> - compatible string "fsl,ls1028a-dspi" can be followed by
> fsl,ls1021a-v1.0-dspi.
> - Change "dspi0@4002c000" to "spi@4002c000" in example.
> - Reorder properties in example.
> - Use GIC include in example.
> - Deprecated fsl,spi-cs-sck-delay and fsl,spi-sck-cs-delay by use common SPI
> property.
> - Use compatible string 'jedec,spi-nor' in example.
> - Split peripheral part to fsl,dspi-peripheral-props.yaml.
> - Remove 'interrupts' and 'pinctrl' from required list.
> - Update 'bus-num' description.
> - Update 'spi-num-chipselects' description by add "cs-gpios don't count
> against this number".
> - Remove 'big-endian' description.
> 
> Co-developed-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> Co-developed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

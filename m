Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5913917581
	for <imx@lists.linux.dev>; Tue,  5 Mar 2024 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709659852; cv=none; b=F0iMdXlYFb4od3kekHhaZR+X8GQkq6pBFxSJ8E8nVc6DQ78zW4gYMaP89VppWWF473aiBHyKdImSxsxEi2M1PZSYBIo5j4OSN9v/SWISR7oXWanXgpYl6mMAl3XfyLiHGj7YZuPnaW8z2u0Uz+XU026ZThhF7EJNS5nzilB6dyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709659852; c=relaxed/simple;
	bh=PvctEXlGZ7nrrcmY9vxGBvaQwelTdL5Q2ErosCz7WL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1biqzExv9TEUDJiD0jDpH/RJM6sTmfiQmG6OMmCt535GHMCbI9U6+I8ddn0Pa84MlEC10LLDCiQOTEztQm9fVFenSkHIdIm6FfYAbaff9QBhrvwXQ6vAb5QAdy7HANYoptHjRqnQpaUQC6K2JpmdE7RSLkm1KC2dc3XEUWgqtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFrSV2bv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFrSV2bv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dd10ae77d8so20078825ad.0
        for <imx@lists.linux.dev>; Tue, 05 Mar 2024 09:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709659850; x=1710264650; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iFSazZv9KuKOFOd0EloyZ1kxaTz5xQ+zm2q9EjRUfYg=;
        b=IFrSV2bvXOA7Af8xEsKCOG1oDoYNe4s8lzBKVwPX4aT01WIc4MAwrS+HQ0b4Xw0Vk2
         eOGHAYP3Ph9CNFNmutwA9wZ+yHkKZdwfH4H6OQHyEEqOuxiOn8DoHz/H8MNqC7rWyPrQ
         2GrCNGpW0Ro5kjEShGP7x3CWiAfcIohyKZ1BttDH41l5WHWZa0CFVYcjBxr0GO4xLuMz
         ezxxxRY3Yv0qRIo7XTqFkfLC+kHlZW7QGC1R9DHu71/KhSRSdClYqlEbvyJhmjuHgTSj
         QzWvGTixbo6qSuByHi928Z0Evd5xHhBgJi5+GpONlQQOWO7pOg7oT9Tew8a+RmGgHnqQ
         O9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709659850; x=1710264650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFSazZv9KuKOFOd0EloyZ1kxaTz5xQ+zm2q9EjRUfYg=;
        b=qbTCuI95Okz13yVF8X/T7gT285awtTnRZukKol0XQ1fZjWbVymSFjbgzOb6fKzsTbU
         TCEcsMVDgBmfVGOAoAJl91kqePoeNeeOarekA6RM9OnxC6L0iEnvj2VwuI+fd1xhd46e
         dNRj2poHhxVMgQIdQ7MBH7C5nImeOiqqtnPwLzRvGY8amlKdz8mdX1m+Tx5RZUPg+ygY
         hon2lTmahwaKHqGdOLQOjniLTQQhdGkIE6GqkbPB1H6dwYxIq49khqC/otO3jDjU2Nw2
         zmoI/LB5Z2A0tnKNFHweB9xxiXSnItzWS4pbe/EvKKdoTJ2OO8Z9Gqk73ArZlc9/Yt7k
         8QBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmfadX8d+TuMx2XEdHtkVUDuzZXOkKt2MH9YAqM/yZpQ9TXW0I5D8hVZiXFBI3JvqO9fphYrvMg9nAXfAxblRYBg1f
X-Gm-Message-State: AOJu0YxDAiNuUqNLwm6hc7mDqYUgeLjNOcVy0Oxv4tVm/C/RP+w7wa7J
	Eq5WWRALjzJmjdyHOHH7jcgc/ZOCwLbRzvapZ95CSBahBSliByAX
X-Google-Smtp-Source: AGHT+IHcbyuVE9cmFQz6s2dkLwDRoCBdnXVosptuYoHArpLCCEckbFHHjUKlL0lQFySh9483/CNm/Q==
X-Received: by 2002:a17:902:cece:b0:1dc:8f8e:63e2 with SMTP id d14-20020a170902cece00b001dc8f8e63e2mr2842097plg.46.1709659850418;
        Tue, 05 Mar 2024 09:30:50 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:a5d5:fe74:fba8:86b5])
        by smtp.gmail.com with ESMTPSA id l13-20020a170903244d00b001dcc28544dbsm10821459pls.78.2024.03.05.09.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 09:30:50 -0800 (PST)
Date: Tue, 5 Mar 2024 09:30:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/6] dt-bindings: input: touchscreen: fsl,imx6ul-tsc
 convert to YAML
Message-ID: <ZedWx79qP7QXc3Om@google.com>
References: <20240226212740.2019837-1-sre@kernel.org>
 <20240226212740.2019837-3-sre@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226212740.2019837-3-sre@kernel.org>

On Mon, Feb 26, 2024 at 10:26:24PM +0100, Sebastian Reichel wrote:
> Convert the i.MX6UL touchscreen DT binding to YAML.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>

Should I pick it though my tree or you'll push the whole bunch through
some other tree? If the latter:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

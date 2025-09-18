Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB262BE635
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 05:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758173972; cv=none; b=K7nAJey1zTwo25xapFa9qc0ab4Z/rSfCm8JM/i0MknwtYNbwBwQy9fR9yiGokXT52Kq9xJCyDc00RwzAUdkG+l3N6JzB4hlBcl+/smc1oVRV7KsyrwOblMHmFpCNXCW2VKHyAjbUcSRzm/y7QWg7r9ds9gips1TijR2dts0ORvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758173972; c=relaxed/simple;
	bh=SaZFIVOdd7T13NXyX4efJUKeQRYQgGhTx3tG1HJaIQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a61p6WMYT4L0bSGNuyjUuYSkfDMIHh9XujgMnR4PN9TT9UqEmYxQ8Seyi3J3ApLtvkw63PI9WWBlAyMMh3XJKTZsKtXrP6uwZh5WYHJCZ7AOC3s/ixCDFW6Dadl8EpmPqmDanCvsIT69fOBIGcnVfcyxnnMhHoTtajuftQvx3cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDymy9iA; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDymy9iA"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-329e1c8e079so446206a91.2
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 22:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758173970; x=1758778770; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XoyqBQApAmmnvu4zkoApx4U/8ormdVXAKsPBgbJPU3k=;
        b=QDymy9iANVIbuZMN8UU4vzdWYFQqBAAOay/n8WO0zl8oARjllC6P+SapiaMkWLFjlw
         Hm3j//23AuKojFxCCFaqcyVGEaWS18UzCayD2EKH/MP33E69Hb2rnXeMma+otdA/TQfE
         owJ6VM7ILMGQNIS/4qXFWHg2TZJik4iMMg/TqUQGx5yrQ8Zjpe5cJDbAUpy3sHTn4DdX
         YknBY1jtiq74Gg6D84A2iqMYLRnikPDW2MSV//AvZ9R+Bjnqfk0RvWty5UQsFsbLhT+H
         fk1arDH/iKxPqOO0ta/nKPZRgz+yoQKZY3fyQg/Sz86DGMI8X/MkuKSM6HYd/H3ILsbj
         CnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758173970; x=1758778770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoyqBQApAmmnvu4zkoApx4U/8ormdVXAKsPBgbJPU3k=;
        b=pa5fgf5ix8OapJPvPOyKXPXor/wcUJZxemA5aKK3lLasNK7jvGLF/y3BMrYQsJo1Tn
         2AYSVxlZDjbrt9d0+nJRtGHaVDtxuLmFBiAyKEFOXj+ASbPKz/kXehd3qdfvMnX8Dgr+
         EAWTA9O4qnMDpahBbvce3+Bz0AVXt4n/VsRFIlg+5r9ugy9yoAMFx25URNhE0+vAAM7P
         YT6t8XnBApB17feW0CXlX3xPT/6coKts13njTWHY1VxSqJEzXS44YQr0sYMgTXLWUlVU
         HRApN8Whi+MfVq/Djfzy+ioa2OdV788AD0ECF0WqocbQEf+z4M16sZHA9rkbM3Ff9hfS
         yQig==
X-Forwarded-Encrypted: i=1; AJvYcCXkg8chtV5jx1VhgqbfdIcc2JOn20xft1QKO4A+bfm6MHO3RUNtxK+1ymdsO5j/MEnkqng=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTZJPa/ZHooGoU/2iQTzqWMSRnhoVoNkog0pl8CcPEY3sfGlRv
	8m6v3LX30vpjjl5iShIY2DYxh+QO2ufYgqftnEos3A4j0/7ysMupyK9L
X-Gm-Gg: ASbGncvqevehBsBze7XP2L/O27JPZ/Kqdq9Fddji8wkotmVyzTaUMeYoMulAkYFW/xw
	y4EJn2E37JcTic877jZKGPHLhGekR6qjikFJ7dmVlm6Ri07UEAlZYF+YnOAO3pg9GSLiSA9n6ud
	Emk2pAx5OWRQMj8zciW3BhDuhtofvUIEVe1lBuMT7YscTp+fxtxGjA8pwGXkd4z8gsonrnDth+Y
	04SggCelbqTJTEOp+ImmonWx4vd1aTF6nxlVRAHhEuZK1Gq8s87W8cT21vuoxohcz0jKXp3n5wM
	hmCPkzBmVaGnSy0pLcuNEf/u8K+pBAAA20EPEgj/ari3Hwy5xV53G0Y+Ld+J3d6094QG44+wcug
	3N3OyUF9ZqINmYZ+FgxS6DaZW+rDwSdgQEl5as5XUkQ==
X-Google-Smtp-Source: AGHT+IGxd0JzuVVJrw68h5tXFHmcZpcwVF2x8DkVRvbM3jhAsZwEYZxEhWmJuR/xbYRB7Jc2BkkC4w==
X-Received: by 2002:a17:90b:3b49:b0:32b:8b8d:c2c6 with SMTP id 98e67ed59e1d1-32ee3f008ddmr5384286a91.14.1758173970420;
        Wed, 17 Sep 2025 22:39:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:194b:8358:5c91:3d3d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfec3db38sm1130199b3a.73.2025.09.17.22.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 22:39:29 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:39:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Frank Li <Frank.Li@nxp.com>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 1/6] Input: imx6ul_tsc - fix typo in register name
Message-ID: <z2kbkmqnvux2ys2mdghfbdwts5je4zkmmk3ctjaisno3kafqoh@xynqe4exjqzm>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
 <20250917080534.1772202-2-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917080534.1772202-2-dario.binacchi@amarulasolutions.com>

On Wed, Sep 17, 2025 at 10:05:06AM +0200, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Replace 'SETING' with 'SETTING'.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 

Applied, thank you.

-- 
Dmitry

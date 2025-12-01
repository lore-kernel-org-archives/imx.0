Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26292199949
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764599507; cv=none; b=hqa6n5nfjOwdHCYgfG1OB1bvsFC5uVOoKH3G1B51EENJpAcdIuq8xZ++FXKaZm3YoBMe+UFuQmfo4quy4X9BaFlr8cD+iRoYKrfiZPjJv14eZREah8eprWpQE6mLgQQHyuu3ayq01HvfLEdH7qeqfmKGrsFC4CPeu8u13zBl6ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764599507; c=relaxed/simple;
	bh=iSzXnkL6CZ7clNjmcPJzJQEgcd8lgXcvAiTHRowiIsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVBvNVALjAOU1oYMegYOGQl0LQ9Lq6/twZ5r680OBcUQKgqYEwo29vEn0wzJoYuQ5F536A81q2UIT0KO2g1YRT10X/0Gtkyyel3Z2e9ToSAy0evsPeILl4y0M57Lc0SiCpKNvGiR0gpswRqc2OjQh4CK2F9QhoOe14hm+4bB6lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gK54c92h; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gK54c92h"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso44183925e9.0
        for <imx@lists.linux.dev>; Mon, 01 Dec 2025 06:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764599504; x=1765204304; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P3Udye7A+1mJEIOEFZOxhVuAe/sJ9GEaxJR6U/sqIe4=;
        b=gK54c92hQXqRbN/3uPrh3yiBcAgQyIdsnpml5pqp6mLYxGjph2j3luQorU5QQYVxW9
         adqDJIdySSDK9tk93WHy7NaXtU4EW/L+lIaLEFBegwW5wsdzb7pfNt9HFUll3JHShOKn
         qQnNp/MQ9XZsgvib+oDtBU7V1eWZmx1ojI9lvblMJxv5VMSYOcs9QBLJYosyWMmGZ9/o
         5TYKb9MrUpG3ETYFqsIOx6zfbUgbuOb6/Y/Qmp/sG94CNt/bi3Ii/jt+co+T3mS2WI5g
         cy0SvgUaeS1e8DT0k/jdH11fC25bQT33iW/1lg66hDaQDWd2Eo3scvOuH62aHOjHdS38
         5Svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764599504; x=1765204304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3Udye7A+1mJEIOEFZOxhVuAe/sJ9GEaxJR6U/sqIe4=;
        b=qZjBqR65uEFW1eUFHP51HJOG27ThkjZTjZEvXI3njxerFAufhGI6Mug8KlEN0IqABQ
         hOdekh2lbzWOaYFOopvNhQG65ADkbfv3ogZCAAOWpqKJqMTZWrpItEmTWgyHQPZ3b/Dy
         odgmPD3kjwEiJMlpuIDGOrisUGG91gCJeHUs0tM65q1NSEQKwuELW+JjcFvi+8eYiif2
         nTz2TEkPYQf7DDUeGsnnnExfMN2UTWBn6Zwni8yYD1sJ/0OhpPnzYODo3zJi0/HnkhSk
         f9GUbmAXRwvP7kuWZ2Og8wtZygF3usDbQhmiNiHNUXuIeXg+Y576uX4Q3Udg20/BudvJ
         RN2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMZrFHKxX4h0LpqH/N4+ZAHhxRC0r1mh8e4tdmM1bstb9AaLm08tmRKQfd7oSKmUeXpdo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdbJNqMDC5UWQw7vccLYv/bPsw+WxDhhOTXMD8mXRZm+ZcSSBw
	yW+AU2+Wb5Vfu2arWnPgLVlClR7b+u8n7dez46wYGXE7eJoi0xZGHM4ziTPR0+0SQV4=
X-Gm-Gg: ASbGncsy5LvP8kDX1f8So9mbxnZ3eeH5y2O51orhtgcuJkKbez7HBBROURWGRhG9pr3
	C4V4YmgddmICvOnTv41PGbrB35P/af77tLajlnjZcWgDLGibQbfL3ZrdmR3VCGdXE07pUSCKB1V
	PYwvCIbyBSxhK0D3dXJilCu4mpS2qb0jwit/7xj5Cp20ROsxRUbZOa3l9FjDfNdxUH1EbR38bSL
	c+H+d1sf20PQ64z/nFhV7kYiV2buCV3TYkonALoXVFspniovIM+otzwY1nTYXVqDgQen47rXvf3
	zoO+8PLXJOi02UQRECboGUw7qCkbp9Au0qpfjbOoCn8Cu1V0IzLOuYnzwJZbe7fkoN5w2LeTmg5
	eXXw5s+TG+ZCMJ/K6FQp4mNuznAYNWDaM8OAd8AgAxmMgTa5s96xniexHMwWsy3zTlljnkLktS9
	Y2nxjKeTnmAw+kuxWU
X-Google-Smtp-Source: AGHT+IH6A6FJXGfT8Zsjwa2/f7hPiOGak401pIC2WoSIqlHjuQJJxsh60eESxFQX7d8Tr6L3Wxf8Ig==
X-Received: by 2002:a05:600c:1f8f:b0:46e:1fb7:a1b3 with SMTP id 5b1f17b1804b1-477c01ee3camr380965655e9.23.1764599504416;
        Mon, 01 Dec 2025 06:31:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479052cf8d9sm154964375e9.9.2025.12.01.06.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:31:43 -0800 (PST)
Date: Mon, 1 Dec 2025 17:31:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: Re: [PATCH 0/4] s32g: Use a syscon for GPR
Message-ID: <aS2myhp8asABFyLt@stanley.mountain>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1764592300.git.dan.carpenter@linaro.org>

On Mon, Dec 01, 2025 at 04:08:14PM +0300, Dan Carpenter wrote:
> *** BLURB HERE ***
> 

Sorry, I obviously meant to write a message here.

The s32g devices have a GPR register region which could be accessed
via a syscon.  Currently only the stmmac/dwmac-s32.c uses anything
from there and we just add a line to the device tree to access
that GMAC_0_CTRL_STS register:

			reg = <0x4033c000 0x2000>, /* gmac IP */
			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */

But it would be better to have a syscon instead of adding each
register to the device tree like this.

We still have to maintain backwards compatibility to this format,
of course.

regards,
dan carpenter


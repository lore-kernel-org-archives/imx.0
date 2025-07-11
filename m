Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC2A287245
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 10:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752229225; cv=none; b=Gz2moIUvNMrj+2yePwov1RsRqq2opVKoTnWrkP2lC8K93+SH0gB7YNk3Upg++hUl5KRriKbgI4I5eHUzA9YsDo/3tZVjxTq9AetM/KPNaCAbvHO6MvomUJPPZ4NfzhMoVnExJzs7rkHQmnlyd9zbk8anrIRkX7nulUjd3fS+pTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752229225; c=relaxed/simple;
	bh=ZLLmIKtHD32BHKSjrmb27QgNt/hb6BAJ7uNG1ceFDyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apL5q2JetLZ+nDFSWsrF7AR3HZGPr5KdS5xtIUHCF+zdLivFLZfoZZrpMGZb0oM0VkDApsi1BO1+aK/OF29hUsrDyerKB3Bn8mrxg27YRAX1/cdCNO982ju3LN+Y2oo0OSoX380pwkQjoi0LgXgNabTA+NKUXUPu7izHayVI3bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYHsgsPf; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYHsgsPf"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso1202084a12.3
        for <imx@lists.linux.dev>; Fri, 11 Jul 2025 03:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752229223; x=1752834023; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4PxmmoD8ljBsL9GD+gzuD61HLwRQpZlooMbeZ6fygS8=;
        b=hYHsgsPfQaL7F4y1DdmWCCsMfaDQxJSb4JoDNAVScy544X1OxelvrijUCwhVJMdNJ3
         Evw+EKeMkMn1yIJx+uj5gjpOe3FbcXdUc9YWh+/wxbeow8qd8DYN7Amk+DaIvl8BQiO8
         wt91WKs3cta8bDyWnKPddJZOi5elmOp8OwPXk2k/h4WOZ8ModXtDeHbsx10QGRBhqGm3
         j27qnH8mFtyflTagMxawuofuzC9VoZOIACcvHl4Xv9g70XixZNKYj+pOPIGf7lZg9UAp
         WhWqPvW64rt70lt9wNYTdvmXOjYuJsRfLF8BTKp4JC9qPgVn1hx27FPXgdK7t4E3/zry
         Cxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752229223; x=1752834023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PxmmoD8ljBsL9GD+gzuD61HLwRQpZlooMbeZ6fygS8=;
        b=Ze9ql/EmQYbqXxtAAi8gs6jDbng2+kuQMEueBT9jUdCmQoPwOVG/brGqsuHPi/YlY1
         WxOQji7JrgkziXDmnpHDi4hXYkWKLfPuBY7Xnv3Gmx8XG+gC7uq51ivVsKBY/zrIxy1g
         U27tcmi/GcproIkZp7MZ1eeaFSfAJ6txO7fdtBAB7jOw9dKuUUcjLO6F13q7kI+EZCCN
         8ftUWYwqY3nbRO9FLG7JfyN+XUKyVB//PCoVwVIWjM2B44pmQVTgBZGSRrxzTLpl1bXL
         2RMqv9QjLl4eluUmmeDm6s7JK6DToATsocHV4+6A8DlWfhk2zr1X9b6hQoeudrtv+W11
         AHCg==
X-Forwarded-Encrypted: i=1; AJvYcCXJzrdBzuNJQFZc6+xfzsEaX3O4Yb8lu6Z4vGpfzvC/5QDHp1031janK7XUelF02fb+UiU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzQ3EuEXVKh51uXvKR1oBYraEnVvVpaXlOV/G275R2p2aJSf3w
	3kMpfst84PVSTY3WQy/mh2cHEbDzaRcv8j+c5MpI3OvC11+gv6LblKt3+LTa5DqQmPljj7AfPYm
	65ccGiMvo3Kdkn79sibgMrSkJ8uMbrxI=
X-Gm-Gg: ASbGncsBeL04wZUERJXpL6Iw+RvxvdKWI4DLseER32zx0FYTJqKeAkGobWd6TzOueG4
	BN/BrdDbN6kQ+wNuXqifzbKWawxONVSXAS04bFuim3kzTVVS6sc0c8KdMFeY/89uQy9dU7px55r
	974cPTe0IJwlJY9pao+vQqcGQEeutlWix1thRpK+3MPgdkqgMRMDoIu0k9Phm7TaAgYPMVvHIgv
	4du
X-Google-Smtp-Source: AGHT+IGcUF2IeFq5d6oOuNzBnemSIDWy3XN/AET4pna7uIiA0s1d9ETHya4xD6sh/N4FeyNQJ2PHRpWfbJp7eAqc7/0=
X-Received: by 2002:a17:90b:280c:b0:315:6f2b:ce5a with SMTP id
 98e67ed59e1d1-31c4f4ca9ccmr3107104a91.11.1752229223013; Fri, 11 Jul 2025
 03:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
 <20250704052529.1040602-2-shengjiu.wang@nxp.com> <aG_SosukEqUxrHvH@p14s>
In-Reply-To: <aG_SosukEqUxrHvH@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 11 Jul 2025 13:22:24 +0300
X-Gm-Features: Ac12FXz1oAWR7AzXrdUqZkykZa3V1NEpvtctgewTWRCMsKsQX5xRmXpD9W21dGo
Message-ID: <CAEnQRZB9r8-HqSJAJJc6iebZcen0CrpWL3n5YXPJOZr=-SZrqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, iuliana.prodan@nxp.com, daniel.baluta@nxp.com, 
	andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This is a much better approach.  During my last review I said that I would not
> move forward with this work until Daniel or Iuliana provide their R-B and yet,
> they have not been added to the recipient list.

Thanks Mathieu, we will have a look at this asap.

We are part of imx@lists.linux.dev so we got the mail.

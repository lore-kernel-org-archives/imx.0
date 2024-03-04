Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EF2381D0
	for <imx@lists.linux.dev>; Mon,  4 Mar 2024 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550742; cv=none; b=JPHl37xRyVFZpu23+j8f5n2dLvgk1Rq5mPtRxy335f0WmaD64iBS1gFJgvnUEo+ACWppb4HGwXNvYKSfkjo3S4rNIfGOjbUsMryJeyeHBaBWwdoNDTpMqIvBzmbwNCkEy98YDTpg47NBg40LjWUBO3N4TeX2KMX+rM0tcuVQnYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550742; c=relaxed/simple;
	bh=6ZkCzawr70iVhSytkJbWHHAWdAJp5VaXL802KLG6CSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jfei8aatF2GRtoaePULSf803INjWK4v8W1jDt9y6EVmnx7fv25Spwz92TqzpN5sLfQX7kDN7WiogxviY7REzq5bGm9HZv0j6vEjyjdW8W/rIqkY6or55bzByWwcgQZ94JE9Q2clTlAXXSsFZviptoFoUowuLtR40cgSaC5HTmo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONoOM0ZX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONoOM0ZX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1db9cb6dcb5so14287535ad.1
        for <imx@lists.linux.dev>; Mon, 04 Mar 2024 03:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709550740; x=1710155540; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZkCzawr70iVhSytkJbWHHAWdAJp5VaXL802KLG6CSM=;
        b=ONoOM0ZXFkPe5CLPvW4rj5PUf7SIEQFfKn8RCKfVhYAK6WY/x3iFcHbduV2t+1DXZ+
         OPPc6frdbcCa+8VsGMcqIEZxoCnA2Q8K8MEPnrAjROZabmpvpbck01O5qtNT6tJjvGJE
         ZA9/q/Ln+DHaaltQlayTOEQ0VwT8w/rmKtBmbyzbhmEKvcI4Ll8OGuLblnplV/HaMIQ6
         DwtIRXcD5sQyNwflajWLqkNeA/ad8NcZrmKOvoRMxvID8wgN5hkOWjj2+I2+zOxjp6p0
         LrMpgTrMv91kv8/jVrsiwKDkiyC8uQSa1jFjl4C4Njlpg5q8NM8OcIWmjjXvIVLaoQRz
         e4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550740; x=1710155540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZkCzawr70iVhSytkJbWHHAWdAJp5VaXL802KLG6CSM=;
        b=LO+AJ6delYirmr44aJu/3ZWYfRraVr4o+ZbDsB9VQUiFUzoo4btoFQo30uYFlbAf9l
         1XGqFNhzJeJ2uH06hpw7g25RSLHcch+rUTUI1oIYBxZ6bDajmNf26a89mtDgHjrdXX0n
         fI/DF6mh4XLvIlw376cQ6Pb3P6Lm4nQGwz2lHuGmMWyexyNbrDOzFDNAcKePtY8qjlkz
         PwTNL8mCuAxPWOJwS0bR1PCjVCZQvMV55DGjI8lr0cAkU+rlV3EFR7yypIgydIOER3lF
         msBsaZsIkvwL3oXaSEcyL9UsshzZ2y6AzKHsGpk2SScRUNTu8ERfhV4uz40BoxUVImTt
         9tzA==
X-Forwarded-Encrypted: i=1; AJvYcCV27c3mAQZm83PeStnEGusPSGLHTEY0YvVnpNOpOmgEidLFNGSjibHCNnoqixkAUuO/SHJORisS2dmfAKFdyjspbWY9
X-Gm-Message-State: AOJu0Yy+8csjeARO4CCN7z98Cm6BohZ2HiC9y/9MpnBOD2v42v3TETJa
	4UyaaiDOgrFiTzEOJUGSPgVB1RMVcSLYOa72humiz3m//ljAIeULPQc+4BwGPP2Shf+T76Cj1BB
	7EU/PyOXtjpI+E/NRjL2nr7cLiHyieh4e
X-Google-Smtp-Source: AGHT+IEU/vpzfP1RaAkx+T0jQDm+f6dkz0d4veGwrfAmSyfH5tKFgW+VMU5rqKHIALIH3Q5NIoakElFocN33G1QYmAc=
X-Received: by 2002:a17:90a:9e3:b0:29b:f79:2ec3 with SMTP id
 90-20020a17090a09e300b0029b0f792ec3mr7088904pjo.3.1709550740384; Mon, 04 Mar
 2024 03:12:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240303-sdma_upstream-v1-0-869cd0165b09@nxp.com> <20240303-sdma_upstream-v1-4-869cd0165b09@nxp.com>
In-Reply-To: <20240303-sdma_upstream-v1-4-869cd0165b09@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 4 Mar 2024 08:12:09 -0300
Message-ID: <CAOMZO5A60zG+1u0NYPFaLsAgCxcF1RxxybVeatovTGj07oxqBA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dmaengine: imx-sdma: Add i2c dma support
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, Robin Gong <yibin.gong@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 1:33=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> From: Robin Gong <yibin.gong@nxp.com>
>
> New sdma script support i2c. So add I2C dma support.

What is the SDMA firmware version that corresponds to this "new SDMA script=
"?

In which SoC has this been tested?

Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EEA19539F
	for <imx@lists.linux.dev>; Thu,  7 Nov 2024 07:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964010; cv=none; b=AomK3bFcj6MFESRlYrApLtpLrwRiFuMcz6VCcXdG9Pze7WU6KngNMrcpYQf8e2SCsFVbImRs/Y3w6yBRVKFrxm4+RwFC1eomq6wZWy23HBXmw7oRmwiE5tbEL8GWSdQEDMw8gETPERkU1HwVAixWPk6DK7NChCzVyqF1hq30728=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964010; c=relaxed/simple;
	bh=jzMCEh7dCrZM991y0x/C9WexSFPZ3+w2RZz+fYTmyAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTGibLUKSlC+93Xur9iQOTsSJXMTHwheNWNv1b5UtGncTJmtlowAL089A6yHImEwtVuS/m9x6zdpRolVPfFZFX0UKnAqGHHgS5WVA9F2mPCsSK90PDpu0O53xMyojNkoTkfiERd5VagTOoBPnfDqgGeA7CczTkFzGZSuQs8AP84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cf6eea3c0so6888075ad.0
        for <imx@lists.linux.dev>; Wed, 06 Nov 2024 23:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730964008; x=1731568808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f87EsgUx9jRfU6fOaKBBba12po3/P9HypMoaCZO0Ifc=;
        b=uhw26Xv7VtSDCeEBh2lI91gI0tDCY5468EyWBmTQFgoX3xTC77/fQO2W1UXI58U+Hp
         fPSDNaR9NsS1lneYRvL6JZC8H9FPfsW+7eY45xjdk6H+vqTrOO/Yf+RBPxrBKSjZZnkB
         BEZsdn18nBttXEoxCwg46z4lxkjTcnM+j8YasWruMQLo2FJPySGNRn0LtsTj7z/hx/zS
         1eOnX+KK3DdIAINHyV4khn4qcvyi7JlYbS7xT+S76GV3iL2pjPmLBJMLn07+fG/LX6MK
         p8N1DPo7QkaWmBVPkNcGILAVP/1PACSEkXflPLY4hiSBivO64NFAowwkYTTEGBuFCVVu
         kNNw==
X-Forwarded-Encrypted: i=1; AJvYcCXZEUMdEqn04thcnd4Pn8hP+AjI1YMozgX2/2XOi+5ubXBaZkN0wgJNsw8cBkIjzTczOBs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yziv0DLttIgUvulpUyo3Ek3995JFPqTM3nLwIHrsMIEpydpZOTa
	wrdymvrJ4czdrKU33okIF2ZwjwXKfOB9iwNJdFUXUWzvfCZku5vL
X-Google-Smtp-Source: AGHT+IGgjRJm1tBjzyx6VNtbd57u2h7PQMgL45gBSJk4BeJmz+8g81AStqWX2H8l0t6FV1sYafgWiQ==
X-Received: by 2002:a17:902:f547:b0:20d:2848:2bee with SMTP id d9443c01a7336-210c6892da8mr604716545ad.16.1730964008443;
        Wed, 06 Nov 2024 23:20:08 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58e5bsm5833335ad.195.2024.11.06.23.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:20:07 -0800 (PST)
Date: Thu, 7 Nov 2024 16:20:05 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
	Frank Li <frank.li@nxp.com>, "mani@kernel.org" <mani@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] PCI: dwc: Fix resume failure if no EP is connected at
 some platforms
Message-ID: <20241107072005.GA378841@rocinante>
References: <AS8PR04MB8676998092241543AEABFAAB8C532@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <20241106222933.GA1543549@bhelgaas>
 <AS8PR04MB8676C98C4001DDC4851035B18C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8676C98C4001DDC4851035B18C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>

Hello,

> > But I don't think you responded to the race question.  What happens here?
> > 
> >   if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
> >     --> link goes down here <--
> >     pci->pp.ops->pme_turn_off(&pci->pp);
> > 
> > You decide the LTSSM is active and the link is up.  Then the link goes down.
> > Then you send PME_Turn_off.  Now what?
> > 
> > If it's safe to try to send PME_Turn_off regardless of whether the link is up or
> > down, there would be no need to test the LTSSM state.
> I made a local tests on i.MX95/i.MX8QM/i.MX8MP/i.MX8MM/i.MX8MQ, and
> confirm that it's safe to send PME_TURN_OFF although the link is down.
> You're right. It's no need to test LTSSM state here.
> So do the L2 poll listed above after PME_TURN_OFF is sent.
> 
> Since the 6.13 merge window is almost closed.
> How about I prepare another Fix patch to do the following items for incoming
> 6.14?
> - Before sending PME_TURN_OFF, don't test the LTSSM stat.
> - Remove the L2 stat poll, after sending PME_TURN_OFF.

If the changes aren't too involved, then I would rather fix it or drop the
not needed code now, before we sent the Pull Request.

So, feel free to sent a small patch against the current branch, or simply
let me know how do you wish the current code to be changed, so I can do it
against the current branch.

Thank you!

	Krzysztof

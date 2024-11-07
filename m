Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5E88BEC
	for <imx@lists.linux.dev>; Thu,  7 Nov 2024 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730997061; cv=none; b=IQSM3Wxu6dbWrG2V21RLL2+95THN2qkGWpnd/HrhdPF7dLq/EM8vr5N6E03/tUgTNbXZdAucl8heoYkD1fn/xwEklynAqc2sGP15od0W4BD4Q/FDdx8JEIZljZUfzWdOs/PumU5W2ys4IzCZfLmNk39KS5gOcylR+dPvTomrMjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730997061; c=relaxed/simple;
	bh=2Q34v2LsrY+KD0YJ9kCB8oYN0UDVVTFhGeqgJTPf5do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4HjAjSIEs2Bq6zkdUutGVHWQdndTFlz0HcxQefGVvRg+dCAsysVXzNPxjYRpkyqX3V2dS5ldmFs7NbcMgvFqu8XpBE8rapE6qQlNozdCs0LxRwfC9vHMYTI5uN/iQWH3vxTY4v7b6L0DOXSL9/VQ6DUUAKNUX2HylvyVuIWikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-207115e3056so12534295ad.2
        for <imx@lists.linux.dev>; Thu, 07 Nov 2024 08:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730997060; x=1731601860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3aIunwJJZwjkSc47JIdSCmw2c2ZlsEQ7RGvz1daEzI=;
        b=PkrsrmuYyW/IGrYE/bQAEYb+1VCVdTH0VaOb2e7Sj8o1m8Z10SmJVhjjTK9YuqI+u8
         KZFM/3bxkZzYPM4cGCbIDpaqIHihGV0jpDsWYZuzSz/iHidkaspg3VNjrfuYAshcQzqU
         copFaPW1L6mXevoU79Cvt5cQufkW3rbNVQ2W+N45iFn+Gp1xBDljVg7t+lUkjDgjAkt0
         Zk93+t/Iorv0tvkSsS2zRjaLY5YKO9P2iRHnGMzRDpPRzwQnGMItw4h4nDzP3SrXKltZ
         xIy35liC2UII1MjFXhgV0i96+SajiLslDav4rrJHV4bN7bFvglzD/8prOmjw7Ou1VH2U
         rTaA==
X-Forwarded-Encrypted: i=1; AJvYcCUiKcj49n48DtE+9oM4V+tFbFHTLZvAO21pZNciFviJfB+pTDYPBenphcWRB+3cld8w3Y0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWLwXekXg0ywgkpB4Utv5tdmt9QZ0ia2BBjPjlF4tHltYIsgYB
	RKhGFP1WTMxq5xsRHl9G4iWipivAunzWCqJvqupRb7RVNn0TyV2sUuOyfrrV2lc=
X-Google-Smtp-Source: AGHT+IEGJto+1JijDqrubHaDC0FIg58jiL9pnEaSMfPJmuQ+AA54UQg+DzpAhfYNveKIfglNcXt2pw==
X-Received: by 2002:a17:903:2343:b0:20c:d18c:1704 with SMTP id d9443c01a7336-2118232bcfbmr352135ad.23.1730997059913;
        Thu, 07 Nov 2024 08:30:59 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dde241sm14228755ad.81.2024.11.07.08.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 08:30:59 -0800 (PST)
Date: Fri, 8 Nov 2024 01:30:58 +0900
From: Krzysztof =?utf-8?B?V2lsY3p577+977+9c2tp?= <kw@linux.com>
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
Message-ID: <20241107163058.GD1297107@rocinante>
References: <AS8PR04MB8676998092241543AEABFAAB8C532@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <20241106222933.GA1543549@bhelgaas>
 <AS8PR04MB8676C98C4001DDC4851035B18C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <20241107072005.GA378841@rocinante>
 <AS8PR04MB8676F00E8F76B695772EB3B18C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <AS8PR04MB86765B904FEC1AA88F6F83468C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB86765B904FEC1AA88F6F83468C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>

Hello,

[...]
> > > If the changes aren't too involved, then I would rather fix it or drop
> > > the not needed code now, before we sent the Pull Request.
> > >
> > > So, feel free to sent a small patch against the current branch, or
> > > simply let me know how do you wish the current code to be changed, so
> > > I can do it against the current branch.
> > Thanks for your kindly reminder.
> > This clean up small patch is on the way.
> Here it is.
> https://lkml.org/lkml/2024/11/7/409

Thank you!

That said, there here have been some concerns raised following a review of
the new patch, see:

  - https://lore.kernel.org/linux-pci/20241107084455.3623576-1-hongxing.zhu@nxp.com

Hence, I wonder whether we should drop this patch and then focus on
refinements to the new version, and perhaps, once its ready, then we
will include it—this might have to be for the next release at this
point, sadly.

Thoughts?

	Krzysztof

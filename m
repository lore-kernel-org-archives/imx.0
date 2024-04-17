Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6766EB7D
	for <imx@lists.linux.dev>; Wed, 17 Apr 2024 07:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713340629; cv=none; b=cGHJVxiP0zXPp9tPgASEgpnL/j1T7l1Ub132GH1fWeiMSdHnFXQhWMvyUcVEo89pdyFg9sfobXLhWc8YZo0I9QW6TtwEt31zEOZuGgTHNnEXvSOUXgFPSztOkDH8lmad15ulbcg74xPpYZd65gxNnQ4klvFrrDrAVHbMBpbBQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713340629; c=relaxed/simple;
	bh=g0N0u9gOAf2wFG4BUbQc7PqWearIDSNnGlyMV7BlUPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otnALG8//V5cusmS7nIgBfLqTsYANxns2GC+BmWO+7ftr80715MH/MCSLQ3HDQ13LfrtRMflY1OoRpivfuT53P8/c0xne7odOFzAERV4mDnpNkaCwyjrgRoUKC5cflT4czAiRcsqy6bFPkl60ddWl0H/r9ayRt3/6Zn0TX0xm5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V2EG8hkU; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V2EG8hkU"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e2c725e234so4286765ad.1
        for <imx@lists.linux.dev>; Wed, 17 Apr 2024 00:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713340624; x=1713945424; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=evO2aNxdV+lvu+Wvrf+ju2Hc2q46w9zOfTh+m4DkhcA=;
        b=V2EG8hkUGcKW2bfK7syEhLF3jXiaWTtCn+flcT8gbWukBzx5kJrpJuccSs4Zu1aU72
         miQJjuRJcDLhte6GXgrgdLv5mtkZiMwXU73Vrtr4MGALeSfdnMTUr5qXoEWI3wOlapRc
         awko5IRnqIhqR4vWuN5LntknaB3DYY8lCEbYQE0faN47814BvhgjMt3pdhia6gd6wKtM
         8YCXf3wUj6vINzNdPIEt0ZEByEHqgG2LT/B1QWJDsOdN2LVValUfyYrx/6QyChEU5mtA
         cvsQWODx/4SblIjoBj7nooHRv8AqKbmhDCWq6MeFpo6l+7xTefc+ifHNZisdvXLhUeD2
         MN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713340624; x=1713945424;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evO2aNxdV+lvu+Wvrf+ju2Hc2q46w9zOfTh+m4DkhcA=;
        b=ZLOUHaWWiSc0d68zcWbk32WEn4jEZ7WwAF0RdmpkRudgYaJ/iMXsl30ScPZJ1SjRLl
         RLq4q0Ql7b8LjrZAFbmokloN9JWKlHvC0lENuEryRUQW3BRg1eUkD+ef4qqAx6gwrt6L
         R1yw3TCabxQq8p02Q26B5FIzvkjA+eG37/4F3D+5YWbfhTnA7PRWdN6zCs+lep2UGul9
         PDYSlpc6Gx9Z+BEc0ptxjkIcFmsid050dFpwibGUm8sMhzoJdWbjj6Mfpr96UFM4thF8
         nsKLO/TMSmYrK9HzBKUfjrUm2vX70h29PR1qJR81pSAWzhiMxQKmIH12s3xcXG87nmZx
         J7tg==
X-Forwarded-Encrypted: i=1; AJvYcCXw5ZuJC7PKpUw+SouoTiUPkH58/igdLbze3okQ2q2dEap6jVRG0hszsLYesKKkb/HECNhWV1/Z0H62L44oxZOfgdQu
X-Gm-Message-State: AOJu0Ywr2STuydBnOHXIloHUUlfVYxdlvFcxWFUrhIWsVJooQnoSVB/E
	1NSCs2boxe0kw4rgWx4rszPWMukkwTI51cHyfKxO+bBVjZ/fyuIchJ+lx0VYlQezrE2JedjVoRc
	=
X-Google-Smtp-Source: AGHT+IFFyHYh8M4+fWRehgScxIXg5jrLdxMhBkxlQ8ODhN7gxnsoZgBvAuBI3hdPZdtAy8cFvr4wdA==
X-Received: by 2002:a17:903:120c:b0:1e0:c0b9:589e with SMTP id l12-20020a170903120c00b001e0c0b9589emr7827576plh.25.1713340624053;
        Wed, 17 Apr 2024 00:57:04 -0700 (PDT)
Received: from thinkpad ([120.60.54.9])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709026e0900b001e4753f7715sm9622249plk.12.2024.04.17.00.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 00:57:03 -0700 (PDT)
Date: Wed, 17 Apr 2024 13:26:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 4/5] PCI: Add PCIE_MSG_CODE_PME_TURN_OFF message macro
Message-ID: <20240417075655.GF3894@thinkpad>
References: <20240415-pme_msg-v6-4-56dad968ad3a@nxp.com>
 <20240416170242.GA164032@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240416170242.GA164032@bhelgaas>

On Tue, Apr 16, 2024 at 12:02:42PM -0500, Bjorn Helgaas wrote:
> On Mon, Apr 15, 2024 at 03:33:28PM -0400, Frank Li wrote:
> > Add PCIE_MSG_CODE_PME_TURN_OFF macros to enable a PCIe host driver to send
> > PME_Turn_Off messages.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/pci/pci.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index 19b4227a8a7e8..1f6d54a5a7cfc 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -30,6 +30,8 @@
> >  #define PCIE_MSG_TYPE_R_LOCAL	4
> >  #define PCIE_MSG_TYPE_R_GATHER	5
> >  
> > +#define PCIE_MSG_CODE_PME_TURN_OFF	0x19
> 
> This is defined in PCIe r6.0, sec 2.2.8.2, so move this below the INTx
> #defines so they're all in the order of the spec sections and add the

I think it was me who suggested moving this up to keep it sorted in ascending
order :/

- Mani

> spec citation to follow the same style as the surrounding #defines,
> i.e.,
> 
>   /* Power Management Messages; PCIe r6.0, sec 2.2.8.2 */
>   #define PCIE_MSG_CODE_PME_TURN_OFF   0x19
> 
> While you're at it, tweak the [1/5] comments to be:
> 
>   /* Message Routing (r[2:0]); PCIe r6.0, sec 2.2.8 */
>   /* INTx Mechanism Messages; PCIe r6.0, sec 2.2.8.1 */
> 
> since the "Message Routing See: PCIe ..." comments are run together
> and need some punctuation between the text and the citation.
> 
> With these,
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> >  /* INTx Mechanism Messages See: PCIe r6.0, sec 2.2.8.1 */
> >  #define PCIE_MSG_CODE_ASSERT_INTA	0x20
> >  #define PCIE_MSG_CODE_ASSERT_INTB	0x21
> > 
> > -- 
> > 2.34.1
> > 

-- 
மணிவண்ணன் சதாசிவம்

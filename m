Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69F612F5A3
	for <imx@lists.linux.dev>; Fri, 17 May 2024 17:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715965937; cv=none; b=s9YmPoHYW1a0HWVBytR6+js9ZFrHORTFDbmSLICeYt4c9dv5O15wkf1B7SWln3LFhVbRO+70vkV2rbiQxiFN9OHuZneB9Kv5k0kTA+ZTSQnvHGCP69gJlfcK4dzUklNZtrfTixgIGiVtfENJLgbsxaUFBNPK3AAtrThZROtOwnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715965937; c=relaxed/simple;
	bh=V7Moi5gWFU3OYOWp1ODvyUp0cpccJTi4lzeR8bBjtxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRVrErBxcEftlAfhMH8HwdB1o4Q5B3K/f3l3lcJl4hnLQRcXGTvTzr6gjOEwvXrpso1JUfXpNo3rbZL+AATggCDpEGKJgKGOhVvt8YvD3tiB2u28ZwKtzIod036Io01whc+37kqMZPdxuWRdepUGuu8/3GoL7JKbg2TCi5t1FVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f693fb0ab6so406026b3a.1
        for <imx@lists.linux.dev>; Fri, 17 May 2024 10:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715965936; x=1716570736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJP3Bvi4LZvT2V50/zdiKAgCKlmfC4y7jjdKq6zUFW0=;
        b=IDCKwlFmgSr/9bdPtWZ+qos3MjliDszFf71LyuTwP1+OhKmzq5pjiJJzJmuQz9kmEW
         tR2C7cy85J2rL2Pbt/BVVk1NBS0+AUtFVNx521wORS0OtV7Lu60E9cbDCx2qvcQNuk04
         txdBgm+lqp5rq5NhVwTN7sW7lUMwdQ6aMg6RzrQU+gDMQJ8iSJQtn/J3o4JLuwgahLJt
         DJCmqOonsOnSsvtv83Ww6xVZxbLnzDQh1d669nga/xV+Ep0vVE/RDVOfIfq4XobOCApA
         wyBVYnXK9L/D4GTgm0YAixG/nNmWCwFlU3EGSD9GOXvWGJrGjboAwQW7KiSU5vCPAYHB
         XLDA==
X-Forwarded-Encrypted: i=1; AJvYcCXc2uQ4Mn6IUz6efsiAEX2FRU/DrIZKlJ/e+0Qg18NZgftMkPOP+rH6N1zSn8H9SsUnd2v/F/likfQQTrUWaAfA4hCK
X-Gm-Message-State: AOJu0YySLAWCOiwkTBvwdj+K/00DfjR4cTFEvzyq/zOWT8RjJcYIcLFo
	F/Cd6vpbDhynsVudhczNCKdQHsY8Nfgs4qTZ+wloHtqluAYvOADf
X-Google-Smtp-Source: AGHT+IERiv3eoMFHKpAJyk5tOavTPrH9L+4rFoAlwWFeIVmvoquPL58lrRrbGXcz8+OzDTGfJm4bUQ==
X-Received: by 2002:a05:6a00:21c6:b0:6f4:9fc7:daf2 with SMTP id d2e1a72fcca58-6f4e02a5f45mr26551627b3a.7.1715965936009;
        Fri, 17 May 2024 10:12:16 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340b57ed97sm15246657a12.23.2024.05.17.10.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 10:12:15 -0700 (PDT)
Date: Sat, 18 May 2024 02:12:13 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v8 0/5] PCI: dwc: Add common pme_turn_off message by
 using outbound iATU
Message-ID: <20240517171213.GE1947919@rocinante>
References: <20240418-pme_msg-v8-0-a54265c39742@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418-pme_msg-v8-0-a54265c39742@nxp.com>

> Involve an new and common mathod to send pme_turn_off() message. Previously
> pme_turn_off() implement by platform related special register to trigge    
> it.                                                                        
>                                                                            
> But Yoshihiro give good idea by using iATU to send out message. Previously 
> Yoshihiro provide patches to raise INTx message by dummy write to outbound 
> iATU.                                                                      
>                                                                            
> Use similar mathod to send out pme_turn_off message.                       
>                                                                            
> Previous two patches is picked from Yoshihiro' big patch serialise.        
>  PCI: dwc: Change arguments of dw_pcie_prog_outbound_atu()                 
>  PCI: Add INTx Mechanism Messages macros                                   
>                                                                            
> PCI: Add PME_TURN_OFF message macro                                        
> dt-bindings: PCI: dwc: Add 'msg" register region, Add "msg" region to use  
> to map PCI msg.                                                            
>                                                                            
> PCI: dwc: Add common pme_turn_off message method                           
> Using common pme_turn_off() message if platform have not define their.

Applied to controller/dwc, thank you!

[01/05] PCI: Add INTx Mechanism Messages macros
        https://git.kernel.org/pci/pci/c/182e6ef0df77
[02/05] PCI: dwc: Consolidate args of dw_pcie_prog_outbound_atu() into a structure
        https://git.kernel.org/pci/pci/c/523d5018701d
[03/05] PCI: dwc: Add outbound MSG TLPs support
        https://git.kernel.org/pci/pci/c/a683a0065ac1
[04/05] PCI: Add PCIE_MSG_CODE_PME_TURN_OFF message macro
        https://git.kernel.org/pci/pci/c/a61a1c5932b0
[05/05] PCI: dwc: Add generic MSG TLP support for sending PME_Turn_Off when system suspend
        https://git.kernel.org/pci/pci/c/33af7f463b68

	Krzysztof

Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD3C30FB9
	for <imx@lists.linux.dev>; Mon, 16 Oct 2023 17:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eP7384q/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ca3a54d2c4so16459705ad.3
        for <imx@lists.linux.dev>; Mon, 16 Oct 2023 10:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697476607; x=1698081407; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oOnkKW9E33HHzsaH2XgU+G+2xfhOZYjGYZoXUL8UE40=;
        b=eP7384q/9p5PiG7REcuBoh0M/Ew5Hs3w5s/49NKes/y0BV5HlWCh5cZ1xA9AV57I++
         m2magfxj/NfOh3bbigW0ceTDKimIJqguGdJNElkrGTrRqcwq66gzay+UarjlmK1U+rLk
         lX6sN+Ss6Hg0rViXJD/2C28zXyj41MI3i1gxvOU2/PHlw/JqL80Pwt1g4b+2KkTd2HlR
         QnsFSSpDXsOAUJmst0OgFTbgzpf6UOhK5td1oD1EUl8C9HGLQBVF2gT7w5/dxdSlWrZs
         rW74Xo5V9XmFeqypmbd2D2C3bXHizJj2h9tbjiNQjc4Tdpf30h+JW013l0e/R2J1NDTH
         Oy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697476607; x=1698081407;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOnkKW9E33HHzsaH2XgU+G+2xfhOZYjGYZoXUL8UE40=;
        b=i33xomRpxbIi2Vk9k+uRXysnbNGHZAQsTMqU/p7qeMbDzS1EqnUzYcLXzibv9T/fTe
         5TJLNFzrv8EoZYJ2iEeqatSlQp6LWNK09+RanyeK5tuiadZYYH3R6XMBLcKW/DFMCo52
         zygr5HED7kW+dSRzRnLhKAsXAqPLV3vrWPsyEhc9P99V14HPM8YEY5aH2//fsN08jjhV
         DyYN/GuOsU5U2vLSBUZw0Whnqom5bu2MJpQbR4WamNi4rsNLJLzxPb9QvRuZq69Ko+vG
         EVuS4J2CKUeWMFsXQXWVTQppWmGT24dM7X28uSpb3UXsXpbBexah9K/jwM4P1p4fQxtx
         IqKQ==
X-Gm-Message-State: AOJu0Yz0V1AR2Lse5Oi/T4B7MP3eg5qSXfJCzog2vXoHFIfTvafHsnzd
	mxylKwXc9qZNKp/VWn4xZdl9
X-Google-Smtp-Source: AGHT+IFho1tjm5iK0/PdZpwOJVLlzh60B+Z1CzCZJ5QivVrZEGbF5FhDL6PPek4KbSf6TWQbtLGYZw==
X-Received: by 2002:a17:903:22c9:b0:1ca:8b74:17ff with SMTP id y9-20020a17090322c900b001ca8b7417ffmr1919597plg.26.1697476606907;
        Mon, 16 Oct 2023 10:16:46 -0700 (PDT)
Received: from thinkpad ([117.207.31.199])
        by smtp.gmail.com with ESMTPSA id c15-20020a170903234f00b001c62b9a51c0sm8698818plh.103.2023.10.16.10.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 10:16:46 -0700 (PDT)
Date: Mon, 16 Oct 2023 22:46:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: aisheng.dong@nxp.com, bhelgaas@google.com, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, jdmason@kudzu.us,
	kernel@pengutronix.de, kishon@kernel.org, kw@linux.com,
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	lorenzo.pieralisi@arm.com, lpieralisi@kernel.org, maz@kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org, tglx@linutronix.de
Subject: Re: [PATCH v2 0/5] Add RC-to-EP doorbell with platform MSI controller
Message-ID: <20231016171637.GJ39962@thinkpad>
References: <20230911220920.1817033-1-Frank.Li@nxp.com>
 <ZQtmpL2vCMgR+Upu@lizhi-Precision-Tower-5810>
 <20230930090249.GB3564@thinkpad>
 <ZSVd5GN7lJUfdF8L@lizhi-Precision-Tower-5810>
 <ZS1N0jgGYfmMsgrJ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZS1N0jgGYfmMsgrJ@lizhi-Precision-Tower-5810>

On Mon, Oct 16, 2023 at 10:50:58AM -0400, Frank Li wrote:
> On Tue, Oct 10, 2023 at 10:21:24AM -0400, Frank Li wrote:
> > On Sat, Sep 30, 2023 at 11:02:49AM +0200, Manivannan Sadhasivam wrote:
> > > On Wed, Sep 20, 2023 at 05:39:48PM -0400, Frank Li wrote:
> > > > On Mon, Sep 11, 2023 at 06:09:15PM -0400, Frank Li wrote:
> > > > > ┌────────────┐   ┌───────────────────────────────────┐   ┌────────────────┐
> > > > > │            │   │                                   │   │                │
> > > > > │            │   │ PCI Endpoint                      │   │ PCI Host       │
> > > > > │            │   │                                   │   │                │
> > > > > │            │◄──┤ 1.platform_msi_domain_alloc_irqs()│   │                │
> > > > > │            │   │                                   │   │                │
> > > > > │ MSI        ├──►│ 2.write_msi_msg()                 ├──►├─BAR<n>         │
> > > > > │ Controller │   │   update doorbell register address│   │                │
> > > > > │            │   │   for BAR                         │   │                │
> > > > > │            │   │                                   │   │ 3. Write BAR<n>│
> > > > > │            │◄──┼───────────────────────────────────┼───┤                │
> > > > > │            │   │                                   │   │                │
> > > > > │            ├──►│ 4.Irq Handle                      │   │                │
> > > > > │            │   │                                   │   │                │
> > > > > │            │   │                                   │   │                │
> > > > > └────────────┘   └───────────────────────────────────┘   └────────────────┘
> > > > 
> > > > @mani:
> > > > 	Do you have chance to review this patch again?
> > > 
> > > I was on vacation for past few weeks. Will take a look in the coming week.
> > 
> > Ping?
> > 
> > Frank
> 
> @mani: did you have chance to look at this?
> 

Sorry for the long delay. I will take a look tomorrow.

- Mani

> > 
> > > 
> > > - Mani
> > > 
> > > > 
> > > > Frank
> > > > 
> > > > > 
> > > > > This patches based on old https://lore.kernel.org/imx/20221124055036.1630573-1-Frank.Li@nxp.com/
> > > > > 
> > > > > Original patch only target to vntb driver. But actually it is common
> > > > > method.
> > > > > 
> > > > > This patches add new API to pci-epf-core, so any EP driver can use it.
> > > > > 
> > > > > The key point is comments from Thomas Gleixner, who suggest use new
> > > > > PCI/IMS. But arm platform change still not be merged yet.
> > > > > 
> > > > > git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git devmsi-v2-arm
> > > > > 
> > > > > So I still use existed method implement RC to EP doorbell.
> > > > > 
> > > > > If Thomas Gleixner want to continue work on devmsi-v2-arm, I can help test
> > > > > and update this patch.
> > > > > 
> > > > > Change from v1 to v2
> > > > > - Add missed patch for endpont/pci-epf-test.c
> > > > > - Move alloc and free to epc driver from epf.
> > > > > - Provide general help function for EPC driver to alloc platform msi irq.
> > > > > - Fixed manivannan's comments.
> > > > > 
> > > > > Frank Li (5):
> > > > >   PCI: endpoint: Add RC-to-EP doorbell support using platform MSI
> > > > >     controller
> > > > >   PCI: dwc: add doorbell support by use MSI controller
> > > > >   PCI: endpoint: pci-epf-test: add doorbell test
> > > > >   misc: pci_endpoint_test: Add doorbell test case
> > > > >   tools: PCI: Add 'B' option for test doorbell
> > > > > 
> > > > >  drivers/misc/pci_endpoint_test.c              |  48 +++++
> > > > >  .../pci/controller/dwc/pcie-designware-ep.c   |   2 +
> > > > >  drivers/pci/endpoint/functions/pci-epf-test.c |  59 +++++-
> > > > >  drivers/pci/endpoint/pci-epc-core.c           | 192 ++++++++++++++++++
> > > > >  drivers/pci/endpoint/pci-epf-core.c           |  44 ++++
> > > > >  include/linux/pci-epc.h                       |   6 +
> > > > >  include/linux/pci-epf.h                       |   7 +
> > > > >  include/uapi/linux/pcitest.h                  |   1 +
> > > > >  tools/pci/pcitest.c                           |  16 +-
> > > > >  9 files changed, 373 insertions(+), 2 deletions(-)
> > > > > 
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > 
> > > -- 
> > > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

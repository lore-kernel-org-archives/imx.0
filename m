Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E4617E9
	for <imx@lists.linux.dev>; Sat, 30 Sep 2023 09:02:53 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9ad8a822508so2050402766b.0
        for <imx@lists.linux.dev>; Sat, 30 Sep 2023 02:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696064572; x=1696669372; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0hizBBm4A8wjMZ1piqiDjr9gInhzk36CKnQSjY0ZpQ=;
        b=rDZ8TXFID+OXJXXw+2vJe2eFtM1c1rcih01IymExp9MOlWDd3r9O5Wusk1E0dv0UQX
         usXLDCGm1dsimZhMpIH9lgKuYWwvAFTWa6Y1WYAzvo3CYRAAYsvgISX/G5WEKiEuYiKV
         qW8/zPvM2B2z3RqvkYrchkDPutKLLBjaP2lZc9nCf9ggzMS9T0AjYvH6IwnGIA08SVwB
         xCF5/Lh4aOEpk+3jtmqF5Wnl1Rw+/uzvehYWfSlefAQ0e92hViTWzGItU/wztvSTslu+
         pJhQnGuMk6exFCNi7Clhwdb+2G14vjJuF4ycTGHl1XOW5tHapaB+/Rmi3HgguQHnQaUH
         xKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696064572; x=1696669372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0hizBBm4A8wjMZ1piqiDjr9gInhzk36CKnQSjY0ZpQ=;
        b=fv7u8HwhWvJQEZppxY8XLKvZhrSk0pam5kQqNAgHtIZmZQGFL+Jggovr+90R2yeuT9
         fESH3YXfI3q8G+hFD9/eNqfMqs8HTSwl4IMwlZ65ggoaa2P4y39uLkYfQaXInilxozLv
         8FGCwcGCzpr9U/ZrZwq3NNMI8VvrUZcIXWLYW7gXvSQs5tRQ0uSV9bdA8646+107yWCQ
         LECf83qpMQzkRugZ8pgDnHI86tECra699s0azURoGcomdaB3tzv0KxK91tQsGKAa0vla
         jGpQPtWk3wvd+bskyLqaAxNZKFyygGqRyrbosZ1sbfQHsuYcZOyCAKImQQL0wEIb14vc
         Ahjg==
X-Gm-Message-State: AOJu0YxWQlqO5ja8yUt3jubEh/B/IdpqWBEvKTWj4sCuwBL3VHrLbG67
	TlJriWjXgl/aKJ3ZREHsoaSL
X-Google-Smtp-Source: AGHT+IHr952WuR/z5EU6Gyhdfd/SNEYlnNbdjLVbmblbMVw53N3v3z8rJmOSwHR0BANmLPzAn2RjbA==
X-Received: by 2002:a17:907:985b:b0:9ae:6a08:6f53 with SMTP id jj27-20020a170907985b00b009ae6a086f53mr5637893ejc.63.1696064572153;
        Sat, 30 Sep 2023 02:02:52 -0700 (PDT)
Received: from thinkpad ([88.128.88.98])
        by smtp.gmail.com with ESMTPSA id bv13-20020a170906b1cd00b00993a37aebc5sm13708153ejb.50.2023.09.30.02.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 02:02:51 -0700 (PDT)
Date: Sat, 30 Sep 2023 11:02:49 +0200
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
Message-ID: <20230930090249.GB3564@thinkpad>
References: <20230911220920.1817033-1-Frank.Li@nxp.com>
 <ZQtmpL2vCMgR+Upu@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQtmpL2vCMgR+Upu@lizhi-Precision-Tower-5810>

On Wed, Sep 20, 2023 at 05:39:48PM -0400, Frank Li wrote:
> On Mon, Sep 11, 2023 at 06:09:15PM -0400, Frank Li wrote:
> > ┌────────────┐   ┌───────────────────────────────────┐   ┌────────────────┐
> > │            │   │                                   │   │                │
> > │            │   │ PCI Endpoint                      │   │ PCI Host       │
> > │            │   │                                   │   │                │
> > │            │◄──┤ 1.platform_msi_domain_alloc_irqs()│   │                │
> > │            │   │                                   │   │                │
> > │ MSI        ├──►│ 2.write_msi_msg()                 ├──►├─BAR<n>         │
> > │ Controller │   │   update doorbell register address│   │                │
> > │            │   │   for BAR                         │   │                │
> > │            │   │                                   │   │ 3. Write BAR<n>│
> > │            │◄──┼───────────────────────────────────┼───┤                │
> > │            │   │                                   │   │                │
> > │            ├──►│ 4.Irq Handle                      │   │                │
> > │            │   │                                   │   │                │
> > │            │   │                                   │   │                │
> > └────────────┘   └───────────────────────────────────┘   └────────────────┘
> 
> @mani:
> 	Do you have chance to review this patch again?

I was on vacation for past few weeks. Will take a look in the coming week.

- Mani

> 
> Frank
> 
> > 
> > This patches based on old https://lore.kernel.org/imx/20221124055036.1630573-1-Frank.Li@nxp.com/
> > 
> > Original patch only target to vntb driver. But actually it is common
> > method.
> > 
> > This patches add new API to pci-epf-core, so any EP driver can use it.
> > 
> > The key point is comments from Thomas Gleixner, who suggest use new
> > PCI/IMS. But arm platform change still not be merged yet.
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git devmsi-v2-arm
> > 
> > So I still use existed method implement RC to EP doorbell.
> > 
> > If Thomas Gleixner want to continue work on devmsi-v2-arm, I can help test
> > and update this patch.
> > 
> > Change from v1 to v2
> > - Add missed patch for endpont/pci-epf-test.c
> > - Move alloc and free to epc driver from epf.
> > - Provide general help function for EPC driver to alloc platform msi irq.
> > - Fixed manivannan's comments.
> > 
> > Frank Li (5):
> >   PCI: endpoint: Add RC-to-EP doorbell support using platform MSI
> >     controller
> >   PCI: dwc: add doorbell support by use MSI controller
> >   PCI: endpoint: pci-epf-test: add doorbell test
> >   misc: pci_endpoint_test: Add doorbell test case
> >   tools: PCI: Add 'B' option for test doorbell
> > 
> >  drivers/misc/pci_endpoint_test.c              |  48 +++++
> >  .../pci/controller/dwc/pcie-designware-ep.c   |   2 +
> >  drivers/pci/endpoint/functions/pci-epf-test.c |  59 +++++-
> >  drivers/pci/endpoint/pci-epc-core.c           | 192 ++++++++++++++++++
> >  drivers/pci/endpoint/pci-epf-core.c           |  44 ++++
> >  include/linux/pci-epc.h                       |   6 +
> >  include/linux/pci-epf.h                       |   7 +
> >  include/uapi/linux/pcitest.h                  |   1 +
> >  tools/pci/pcitest.c                           |  16 +-
> >  9 files changed, 373 insertions(+), 2 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 

-- 
மணிவண்ணன் சதாசிவம்

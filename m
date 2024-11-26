Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE71139D07
	for <imx@lists.linux.dev>; Tue, 26 Nov 2024 04:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732595131; cv=none; b=aj3UghIGuZnSLfJ1WIkVmg/si3Jy/9JAmSs+Q0VTSxXonGCPPD7vhcQpCRJq6/1pLgEhuGv5KlwEmzl3g3FV8O07uag8dnZs4lHct6lQ51T7FYbbl42qVAALo3XXbWgS8Oy8e29jqkqq66FSx+GpHxtrzA1LREUeriIbKlQqadU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732595131; c=relaxed/simple;
	bh=49b5KPFCGeG4jqIym4dKnHwbJ2y+WKZuLkN9bMY/JZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEup9HQqzxAsbkoK9eAnYHAHoXGWVs2J/cKWW2BsdsBCX/YXLAhywdCvHvJIfUwJ/GmLhKVXMkTohI+GPb1q4f2l4LParoPH0E3G40Qfb5miZEOICqp3qa4kQuOYPcKB2oko1p/N8ZL0MuLg1IOmizBsFH1EXKTdb+wHbjFpu00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rjE4xJYS; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rjE4xJYS"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fc2b84bc60so1408680a12.1
        for <imx@lists.linux.dev>; Mon, 25 Nov 2024 20:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732595128; x=1733199928; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M18YC0Kp65Lfw3d4dxJ4qs4YXSEhWbUDO3Hpb2pZiiY=;
        b=rjE4xJYSaiSulLpnUdjmMXByfP5SHNXUGiNIT/obxTrTQ8oq7IvXmViNonpKjlHIay
         CSXDQXWmpAFzG/RvTF9J9bcv3hgk4KuWcsvECv1AlX6TKEfabtxnhHf62YGWU8kPtt8T
         gOYm5hvMHZT66iNtdRkYQlqy81thRYiaC7IeG7QCO74rC1CCeeohK7Yv68II/iqbLJ3I
         w8Oz85jd3sCOocrW/66BmPISX8SP6GYSl+UJeczGAjgcnT7nR9k4iBTlSDBs4EN1laGj
         piFPk4VePnVCrq4k4tq4vGOnXRPAoH8EgC71gQfv+soLA9wzdG/xKIugUak7CRwqQS+4
         7vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732595128; x=1733199928;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M18YC0Kp65Lfw3d4dxJ4qs4YXSEhWbUDO3Hpb2pZiiY=;
        b=QiQPpgBMXxPAQZ5+KtgKrWUuIWe4Xk3gRopceEJaNUj5XTNdMwuEl+pYzJez+JrxJn
         KVU6murVGJq4fNZ2E08jaVmhlsO89opXD4TirjDR/15cfCxKmJ4zpH3XbIwY0DDnY+FL
         vvKvSq182k/jb9g6+B7+duFwvR2s3GmHeNJVzsHtce9euuK/3epF2KEbb330S4C6Fk4B
         G39Tl50cg5rzrrB6Qfv4UJzVT5XqkWhh9Llj3/lCb92/QaGXqyYDMuVbmbK73XY0pIWY
         0MLIDxmUBxxrjDDDX8w5uigjd7aWYae7FY6Edrtnrl17zmkXFQjD12xXNRjPDTmG6p6f
         vhTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuHNVj+74QCQ9fJYJk4+RRrCv8m2TqvKXTFZ3N2K/smqdLoOHHUWGXMmSANiwZQ7fcNDU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4UcywPzjG3m4svlCHEa0bvFZPpnKEo8QrXE8ZQi1w4zStG4rH
	aHsaLnJ821MRtQz1cYJ7dHWV1oyr9ZgHc8QtiApO9k0jUr/34KzI8YvcBdeXsA==
X-Gm-Gg: ASbGncs2tYQfrHoPPg03VrSGqVkdo4M9Y6GsrXpCT0zUZ2xBDnJKVcz++7UsI/TyHtn
	g/c84THVA8DnqQyq/vQ/4PUw2PILHQ5RuCvjgo7ABYJAdd7GESBqRl/anxwCI/lJp+gfMM5d7zQ
	uhZzt3X/68+A7RmKmivAzhFv3ujTbI3WIkcH+mZ469HXGX3mNti6KrkufLzIaLtLYCquAU1NUcc
	Os3ivZ25Qqawn/McHBIv1XOnYq3dXi36I5bzopvVDse9GMnMjRhRQQwrhfgcgo=
X-Google-Smtp-Source: AGHT+IHXYEVRCc1r40Dr+vrjcLn4v+Y2xzjJi8l6gRqNViOcoudZsio00+eNjNpeLC1iSpTxfFOYJg==
X-Received: by 2002:a05:6a20:9143:b0:1e0:cbcf:8917 with SMTP id adf61e73a8af0-1e0cbcf8eeemr8491232637.21.1732595128183;
        Mon, 25 Nov 2024 20:25:28 -0800 (PST)
Received: from thinkpad ([220.158.156.172])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc3de2cfsm6453059a12.65.2024.11.25.20.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 20:25:27 -0800 (PST)
Date: Tue, 26 Nov 2024 09:55:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
	dlemoal@kernel.org, maz@kernel.org, tglx@linutronix.de,
	jdmason@kudzu.us
Subject: Re: [PATCH v8 4/6] PCI: endpoint: pci-epf-test: Add doorbell test
 support
Message-ID: <20241126042523.6qlmhkjfl5kwouth@thinkpad>
References: <20241116-ep-msi-v8-0-6f1f68ffd1bb@nxp.com>
 <20241116-ep-msi-v8-4-6f1f68ffd1bb@nxp.com>
 <20241124075645.szue5nzm4gcjspxf@thinkpad>
 <Z0TNMIX4ehaB+mSn@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z0TNMIX4ehaB+mSn@lizhi-Precision-Tower-5810>

On Mon, Nov 25, 2024 at 02:17:04PM -0500, Frank Li wrote:
> On Sun, Nov 24, 2024 at 01:26:45PM +0530, Manivannan Sadhasivam wrote:
> > On Sat, Nov 16, 2024 at 09:40:44AM -0500, Frank Li wrote:
> > > Add three registers: doorbell_bar, doorbell_addr, and doorbell_data,
> > > along with doorbell_done. Use pci_epf_alloc_doorbell() to allocate a
> >
> > I don't see 'doorbell_done' defined anywhere.
> >
> > > doorbell address space.
> > >
> > > Enable the Root Complex (RC) side driver to trigger pci-epc-test's doorbell
> > > callback handler by writing doorbell_data to the mapped doorbell_bar's
> > > address space.
> > >
> > > Set doorbell_done in the doorbell callback to indicate completion.
> > >
> >
> > Same here.
> >
> > > To avoid broken compatibility, add new command COMMAND_ENABLE_DOORBELL
> >
> > 'avoid breaking compatibility between host and endpoint,...'
> >
> > > and COMMAND_DISABLE_DOORBELL. Host side need send COMMAND_ENABLE_DOORBELL
> > > to map one bar's inbound address to MSI space. the command
> > > COMMAND_DISABLE_DOORBELL to recovery original inbound address mapping.
> > >
> > > 	 	Host side new driver	Host side old driver
> > >
> > > EP: new driver      S				F
> > > EP: old driver      F				F
> >
> > So the last case of old EP and host drivers will fail?
> 
> doorbell test will fail if old EP.
> 

How come there would be doorbell test if it is an old host driver?

> >
> > >
> > > S: If EP side support MSI, 'pcitest -B' return success.
> > >    If EP side doesn't support MSI, the same to 'F'.
> > >
> > > F: 'pcitest -B' return failure, other case as usual.
> > >
> > > Tested-by: Niklas Cassel <cassel@kernel.org>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Change from v7 to v8
> > > - rename to pci_epf_align_inbound_addr_lo_hi()
> > >
> > > Change from v6 to v7
> > > - use help function pci_epf_align_addr_lo_hi()
> > >
> > > Change from v5 to v6
> > > - rename doorbell_addr to doorbell_offset
> > >
> > > Chagne from v4 to v5
> > > - Add doorbell free at unbind function.
> > > - Move msi irq handler to here to more complex user case, such as differece
> > > doorbell can use difference handler function.
> > > - Add Niklas's code to handle fixed bar's case. If need add your signed-off
> > > tag or co-developer tag, please let me know.
> > >
> > > change from v3 to v4
> > > - remove revid requirement
> > > - Add command COMMAND_ENABLE_DOORBELL and COMMAND_DISABLE_DOORBELL.
> > > - call pci_epc_set_bar() to map inbound address to MSI space only at
> > > COMMAND_ENABLE_DOORBELL.
> > > ---
> > >  drivers/pci/endpoint/functions/pci-epf-test.c | 117 ++++++++++++++++++++++++++
> > >  1 file changed, 117 insertions(+)
> > >
> > > diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> > > index ef6677f34116e..410b2f4bb7ce7 100644
> > > --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> > > +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> > > @@ -11,12 +11,14 @@
> > >  #include <linux/dmaengine.h>
> > >  #include <linux/io.h>
> > >  #include <linux/module.h>
> > > +#include <linux/msi.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/pci_ids.h>
> > >  #include <linux/random.h>
> > >
> > >  #include <linux/pci-epc.h>
> > >  #include <linux/pci-epf.h>
> > > +#include <linux/pci-ep-msi.h>
> > >  #include <linux/pci_regs.h>
> > >
> > >  #define IRQ_TYPE_INTX			0
> > > @@ -29,6 +31,8 @@
> > >  #define COMMAND_READ			BIT(3)
> > >  #define COMMAND_WRITE			BIT(4)
> > >  #define COMMAND_COPY			BIT(5)
> > > +#define COMMAND_ENABLE_DOORBELL		BIT(6)
> > > +#define COMMAND_DISABLE_DOORBELL	BIT(7)
> > >
> > >  #define STATUS_READ_SUCCESS		BIT(0)
> > >  #define STATUS_READ_FAIL		BIT(1)
> > > @@ -39,6 +43,11 @@
> > >  #define STATUS_IRQ_RAISED		BIT(6)
> > >  #define STATUS_SRC_ADDR_INVALID		BIT(7)
> > >  #define STATUS_DST_ADDR_INVALID		BIT(8)
> > > +#define STATUS_DOORBELL_SUCCESS		BIT(9)
> > > +#define STATUS_DOORBELL_ENABLE_SUCCESS	BIT(10)
> > > +#define STATUS_DOORBELL_ENABLE_FAIL	BIT(11)
> > > +#define STATUS_DOORBELL_DISABLE_SUCCESS BIT(12)
> > > +#define STATUS_DOORBELL_DISABLE_FAIL	BIT(13)
> > >
> > >  #define FLAG_USE_DMA			BIT(0)
> > >
> > > @@ -74,6 +83,9 @@ struct pci_epf_test_reg {
> > >  	u32	irq_type;
> > >  	u32	irq_number;
> > >  	u32	flags;
> > > +	u32	doorbell_bar;
> > > +	u32	doorbell_offset;
> > > +	u32	doorbell_data;
> > >  } __packed;
> > >
> > >  static struct pci_epf_header test_header = {
> > > @@ -642,6 +654,63 @@ static void pci_epf_test_raise_irq(struct pci_epf_test *epf_test,
> > >  	}
> > >  }
> > >
> > > +static void pci_epf_enable_doorbell(struct pci_epf_test *epf_test, struct pci_epf_test_reg *reg)
> > > +{
> > > +	enum pci_barno bar = reg->doorbell_bar;
> > > +	struct pci_epf *epf = epf_test->epf;
> > > +	struct pci_epc *epc = epf->epc;
> > > +	struct pci_epf_bar db_bar;
> >
> > db_bar = {};
> >
> > > +	struct msi_msg *msg;
> > > +	size_t offset;
> > > +	int ret;
> > > +
> > > +	if (bar < BAR_0 || bar == epf_test->test_reg_bar || !epf->db_msg) {
> >
> > What is the need of BAR check here and below? pci_epf_alloc_doorbell() should've
> > allocated proper BAR already.
> 
> Not check it at call pci_epf_alloc_doorbell() because it optional feature.

What is 'optional feature' here? allocating doorbell?

> It return failure when it actually use it.
> 

So host can call pci_epf_enable_doorbell() without pci_epf_alloc_doorbell()?

> >
> > > +		reg->status |= STATUS_DOORBELL_ENABLE_FAIL;
> > > +		return;
> > > +	}
> > > +
> > > +	msg = &epf->db_msg[0].msg;
> > > +	ret = pci_epf_align_inbound_addr_lo_hi(epf, bar, msg->address_lo, msg->address_hi,
> > > +					       &db_bar.phys_addr, &offset);
> > > +
> > > +	if (ret) {
> > > +		reg->status |= STATUS_DOORBELL_ENABLE_FAIL;
> > > +		return;
> > > +	}
> > > +
> > > +	reg->doorbell_offset = offset;
> > > +
> > > +	db_bar.barno = bar;
> > > +	db_bar.size = epf->bar[bar].size;
> > > +	db_bar.flags = epf->bar[bar].flags;
> > > +	db_bar.addr = NULL;
> >
> > Not needed if you initialize above.
> >
> > > +
> > > +	ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, &db_bar);
> > > +	if (!ret)
> > > +		reg->status |= STATUS_DOORBELL_ENABLE_SUCCESS;
> > > +	else
> > > +		reg->status |= STATUS_DOORBELL_ENABLE_FAIL;
> > > +}
> > > +
> >
> > [...]
> >
> > >  static const struct pci_epc_event_ops pci_epf_test_event_ops = {
> > >  	.epc_init = pci_epf_test_epc_init,
> > >  	.epc_deinit = pci_epf_test_epc_deinit,
> > > @@ -921,12 +1010,34 @@ static int pci_epf_test_bind(struct pci_epf *epf)
> > >  	if (ret)
> > >  		return ret;
> > >
> > > +	ret = pci_epf_alloc_doorbell(epf, 1);
> > > +	if (!ret) {
> > > +		struct pci_epf_test_reg *reg = epf_test->reg[test_reg_bar];
> > > +		struct msi_msg *msg = &epf->db_msg[0].msg;
> > > +		enum pci_barno bar;
> > > +
> > > +		bar = pci_epc_get_next_free_bar(epc_features, test_reg_bar + 1);
> >
> > NO_BAR check?
> 
> This is optional feature, It should check when use it.
> 

NO. Why would you call request_irq() if the doorbell BAR is not available? It
doesn't make sense.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

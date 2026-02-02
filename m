Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E23A367F4C
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770039442; cv=none; b=svq+Du0Ce3TWXDRYe8/hc9BX75beTEoStXWAwjMDU0/HXZl1iiWCT6TpAhVnTPrrzpCL9u64LWzTdmRR9lxE4d0D7OMBMXwGy6YGmnMN4az19hkfTaCFLy+bQQYUt8bUTaQ1BRbEScNZIM/tL2tbtlGxfFc0TQ4jQORNWAXn4GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770039442; c=relaxed/simple;
	bh=V6Tfoe3HRWqS64lmo1MNdCN5YwtOZQCUr/ZQi4ndplk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvrq5/8x4AS4w/bD6252RmuDDKr0uYjkwhAN/b8ScwOKYFcHpzDV355l+ppEIdo8z+K77hqdt3X08QZQYQLhALM2sBnWM2NpTAvHroKWfWbptWyfEbsLuNz/TovYmMO1P5qKJTthzgSn4oTFK6AWF1RMrccyBIlB3Sf5ZqPywZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zZcbxpG4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zZcbxpG4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbc305914so3993926f8f.0
        for <imx@lists.linux.dev>; Mon, 02 Feb 2026 05:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770039439; x=1770644239; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sMtwM17CKX/8W2nz2qFNN/9+egceBVoLznQr83mTsDY=;
        b=zZcbxpG4j1pm+SDVFsWY0AVJijF5cqtZ6ZEL4VudJglee089f2MjK22z2Mdw+hWEyv
         0iJaXGqZmvlZCRYEAbOK1o9wzCRh69zph3jBee2ct2S1fwdBTIjhBYx8+vK+ohwMjRBp
         /dIMh0eAKFEZMRJ/Wl3aqw7pAP5FL0kOkDC0ygrmMnDuc3nNOg3WCE5cliGFlnt/iBDB
         Dls2D9SjpG/hr2Zgz+CjcbydP04rG081A3oJd4wjZAsvxtD6CWkDPyiacDRseE5H6uuU
         NBdlx9j4wJZxhvwZ0NlYw5wo0i7YG+J3rviDZ458KClCFUHUvCCHX5uuRa9Maj4V6edH
         VB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770039439; x=1770644239;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMtwM17CKX/8W2nz2qFNN/9+egceBVoLznQr83mTsDY=;
        b=AZnqzY5BBn5EZ1dpWUtz3xOrG2zxX7Qld+zrT2uF1btD/nT07uvthKTIeefVURd/8I
         nPcQZTMKwU2Z/nlfhnk/KtYQk24KSBasxD7PVdJ8OmxDnWX4MsRT1ewb+lUmy8EVO660
         Zuyb7g0H5WmFRBMnhZZeCfxElN95VdD+2L9HRWGPbJaHzRV1JbDvH6JEwQiKzgyejhLl
         Tb0RAyACaA89V6wcktlAdq/kNIJLSmILaQ7zO1KE5q+4vL9355X63LNerft5AaS1bIA4
         9sG7Kg7+9U8MPkOU6vSuMgKIHijwPfLgzClKf+W2UWc60wQsayyiOshxpgeREpZvXuNW
         OOtw==
X-Forwarded-Encrypted: i=1; AJvYcCUILG7OS28uutwzf6sbih29HOidsW3nm4Bsl9Z/ev6xx+voON/j6scAYlX/c8lMK2+HM3I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvZ71eqI1YRmuLxuamWvPX+qCK4FchXyvoQSndL66xp0ZJ8HMP
	zPe8HZpMVynEt6pVDaYlcu/MGZjjEeI7YphsYk8DssqpVFO1PqUIwUOVcPOqlrBUJ5E=
X-Gm-Gg: AZuq6aJd9NAaP1GlNq183nk9+TUMCzRTfh8AMbH9igEPgTjsbHgLJ3JO6Hd4y1PGCy5
	2cf4KhPxW9zYaVXg1ks7a6u/u8UQ2RqVyhh+Y25rvRdI07BFAVs9UdNA953rZX0Ax83dwIAPqsm
	pW+KxlAnOBULZIipp2DaBvdO0qrNLBAJYjJI+yWgsy+IWZDTtEES+PgCrqhCrq/GL7YSxurauoA
	CuoxsKPrpfkJrzxgiWm6tJcbAImg4SpQH9C9OyF5sr4VkCM1VOB9MsYbQ6SvTKIuRuobatzWoqW
	yGvpmeCvvs2MxqFjc5BrSPQWwfYg5LyIXAEi53eGwBzLJ+iHWXetA8TJS5whc5qwkDA1IiG8NeJ
	GsrZ5t5a/EGypPbDPm0exRgCtzyc+8JaO1+0ga/Jvr0HX/OaEz87qjUkL4/sK8ttg18oMvTb7xH
	ZrUKRHVZzTLVS9XQ==
X-Received: by 2002:a5d:5850:0:b0:435:dbe3:c6b1 with SMTP id ffacd0b85a97d-435f3a92b77mr17179529f8f.25.1770039439418;
        Mon, 02 Feb 2026 05:37:19 -0800 (PST)
Received: from vingu-cube ([2a01:e0a:f:6020:7cf3:628:f0e:cd4d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce93sm43065097f8f.24.2026.02.02.05.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:37:15 -0800 (PST)
Date: Mon, 2 Feb 2026 14:37:14 +0100
From: Vincent Guittot <vincent.guittot@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: s32g: Fix ports parsing
Message-ID: <aYCoiulppKnvvOpp@vingu-cube>
References: <20260202130756.1421488-1-vincent.guittot@linaro.org>
 <scnf5gh3h5pwvnbe4bwtztdlgcpvvtse4fg64bto2jgyotfpwl@sle4k4ky3gtu>
 <CAKfTPtBZCLiq0E-a2QA5X_Bix2PxXiCyuCira1V_wBWZORUS6A@mail.gmail.com>
 <howlzhze3axqiguqvxslssc2tr7ocaa7l2obr4623n3piw5xee@ujnyo5bieril>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <howlzhze3axqiguqvxslssc2tr7ocaa7l2obr4623n3piw5xee@ujnyo5bieril>

Le lundi 02 févr. 2026 à 18:58:34 (+0530), Manivannan Sadhasivam a écrit :
> On Mon, Feb 02, 2026 at 02:23:52PM +0100, Vincent Guittot wrote:
> > On Mon, 2 Feb 2026 at 14:18, Manivannan Sadhasivam <mani@kernel.org> wrote:
> > >
> > > On Mon, Feb 02, 2026 at 02:07:56PM +0100, Vincent Guittot wrote:
> > > > No error return is missing after the loop resulting in removing the
> > > > ports from the list.
> > > >
> > > > Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
> > > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-nxp-s32g.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > index 47745749f75c..767f5a622441 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > > @@ -285,6 +285,8 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
> > > >                       goto err_port;
> > > >       }
> > > >
> > > > +     return 0;
> > > > +
> > >
> > > Hmm. So the initial 'ret = -ENOENT' will become redundant and you'll return
> > > success even if there are no Root Ports in DT.
> > 
> > good point.
> > 
> > >
> > > You should do:
> > >
> > >         if (!of_get_available_child_count(dev->of_node))
> > >                 return -ENOENT;
> > 
> > or maybe
> > 
> > +       if (!ret)
> > +               return 0;
> > 
> 
> That'll work too. For some reason, I initially thought it would be ugly, but it
> doesn't :)

In fact this enables more changes and I end up with:

@@ -282,12 +282,12 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
 
 		ret = s32g_pcie_parse_port(s32g_pp, of_port);
 		if (ret)
-			goto err_port;
+			break;
 	}
 
-err_port:
-	list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
-		list_del(&port->list);
+	if (ret)
+		list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
+			list_del(&port->list);
 
 	return ret;
 }
-- 


> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

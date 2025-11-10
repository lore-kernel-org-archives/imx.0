Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0DB2475CF
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766103; cv=none; b=m/Ti4W5IMqkjUCxbleJXkr/Pjq//NkaOoMGK80DFplCz5Lxu8Nhf+Xdp527JJDl55MI0rnvq7pamdeW5las0Vpu3wF2EOJmeOwvsnWY6RiqR0/3Uj0bF8skuJ6liXC/5yzqYClXKROBoFiXpUmv4OqmYUrzBb/9JyzdufnD99tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766103; c=relaxed/simple;
	bh=2+PqvTsIgaNTk/7uCk6kfDMTr3xQc57xAYsQHUDudqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmeSVWb7w9Wq5D6qjfpfmc17rWRXuSg90RD8gWCVKYw4s9vxihbaQfI2h5NDgQ3xgvES7oJ2Zr6Qeac6hNAz0/OYTsu61ItW9bgZFdQ1ZXJ/Pr6buOUzA3+maXutoKqXiaYTaCBdKxVdGeKrugePieYeURl6QansnM5oz4Bf7ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GW/u6nYa; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GW/u6nYa"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6419e6dab7fso642971a12.2
        for <imx@lists.linux.dev>; Mon, 10 Nov 2025 01:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762766100; x=1763370900; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NXFnmmWcp+T86M4X7Xk/v6jPWKY4nv9UjyUBijcqLEQ=;
        b=GW/u6nYaecfMxdf5KDX/llaxABIUZlezKQjoyEzJv77Kk64tXXe64S+AK1iZLiMp/v
         g6jSzTW/6jlUhiaiCwZzL/0cwJze7P5HEoJnKpTQsCUDBqSYVIE2T0aao714iE10ydWR
         3bPUMg/JdqXYuTR8faP1a3bTi+vMPnYh01em/NK6V38k6CYXO7ZE9vzG8OJeSsjeShNr
         VhduZwwr8pWMPdil1CIYP+uh2RjzsJiNIwESJoLlrv4vfXLeXOlYp+4O3GOQC5cSwvJw
         cvrVGnCjuQ5inrps8G52hF2/zO+PBZRE8fMY8qv8Yj5GgyjO5yFB3FsX3jphfmjw4+ef
         iJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766100; x=1763370900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXFnmmWcp+T86M4X7Xk/v6jPWKY4nv9UjyUBijcqLEQ=;
        b=hUtXkIY95FlAZcCWbMW/RRmXb73iYWJap3ZhPFIN/X6b3btYqGNOA6ZzPp81KTcb/F
         b3ZkofnRXIYCsFJ3F0uQ4HmdD59hIolqtEdh9SLyCEsBlLBPfBCFRaxOlMLwk2tz3iHK
         3kAuiljHwWrh0p0TZQKTPeYrQNSfF+PpGCaXT+R615W/2tmPdiA8rw2dTV2gJHRv+uO5
         qG2/9/oDAXqXK5hf6HCEWsvp12AJvL7r5MkxzmNTtMmJbB3MNVheqaBG4NHgDEHOCTkw
         7g3RMjsjqh02I4/iKrQNjjbyQKOc/q3LfNdRO2gsAG34ARePPqEYNioFV3uxUTw8a+SN
         Z+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdzZSwyl5yUAgl84xMPnhb3r+FfLXOtghKpNwHBENnoXhMbIWgXJMCLoOCYpT7opcw9v0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdaRLWTvqKRCizIaqpnSHBf0p1HVBYGfIsZbSLODdbCJV7xeIe
	GR441cDACzPnzQsTCKOBebrKAi4Uu7x2zQImAUhvR8kc54cl/ogahsfIsDqxU8ovZDx93KmOKz0
	8aRt9S2iLmwWu/nVXSLKPu+rur3sDw9uKoSVnF2+YfA==
X-Gm-Gg: ASbGncsVgXQFwHSsXGcMI6lJjB4or9pIyLDMaGBR7vfyNkB8upP4KmsW19pbGuAxony
	kKgq/LYwrnbZP1EWz+aHNUUdWYMMKgvOJI6/NokCnODcTbm/NjE62BFWI7EVCTnzLnHoBQxHRYJ
	64g7V/JwsGb6rC6SkFuKuI9cwrw0o3jxKIHSCw3TnbiDUzqrfktrfck1ekQq5RGUqXJU8aWibeY
	v0nsravEw8VUN4EJTDBpxNwC3GTqJlWL06bsHY7hXsGuHLGKjtP887OgxseuK+jOaUQHilhbbTI
	FSV5eQ3vKQvjgty3RIhQs90TRZqc1rZSwvA=
X-Google-Smtp-Source: AGHT+IG5jsntiKbL9XDoTScxbX6sK0/o8ty8iuXm+qmOqxUowPC2iS+ovEiKsBoSdXQkOeKy6r5NlaZELkfmqB0OJxc=
X-Received: by 2002:a05:6402:26d0:b0:640:cd2a:3cc1 with SMTP id
 4fb4d7f45d1cf-6415db564bbmr5934589a12.0.1762766100006; Mon, 10 Nov 2025
 01:15:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKfTPtC87w7RVSDAXWXRX1sjgo4s=_Z_k62+mfTXrMZwmkEpFg@mail.gmail.com>
 <20251106173853.GA1959661@bhelgaas>
In-Reply-To: <20251106173853.GA1959661@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 10 Nov 2025 10:14:48 +0100
X-Gm-Features: AWmQ_bmdJnu871GRec3avwkB2KMRGJUSatF4zpeqoF6tG3-YU67MrrGvp-or-eI
Message-ID: <CAKfTPtD3UUXq=PwBJKx2q5VEBbAie-M1XgTbx3hmxZV1yQGBww@mail.gmail.com>
Subject: Re: [PATCH 1/4 v3] dt-bindings: PCI: s32g: Add NXP PCIe controller
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, chester62515@gmail.com, mbrugger@suse.com, 
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com, 
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org, Senchuan Zhang <zhangsenchuan@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Nov 2025 at 18:38, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Senchuan]
>
> On Thu, Nov 06, 2025 at 09:09:01AM +0100, Vincent Guittot wrote:
> > On Thu, 6 Nov 2025 at 08:12, Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > On Wed, Oct 22, 2025 at 07:43:06PM +0200, Vincent Guittot wrote:
> > > > Describe the PCIe host controller available on the S32G platforms.
>
> > > > +            phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > >
> > > PHY is a Root Port specific resource, not Root Complex. So it
> > > should be moved to the Root Port node and the controller driver
> > > should parse the Root Port node and control PHY. Most of the
> > > existing platforms still specify PHY and other Root Port
> > > properties in controller node, but they are wrong.
> >
> > Yeah, we had similar discussion on v1 and as designware core code
> > doesn't support it, the goal was to follow other implementations
> > until designware core is able to parse root port nodes.  I can add a
> > root port node for the phy and parse it in s32 probe function but
> > then If I need to restrict the number of lane to 1 instead of the
> > default 2 with num-lanes then I have to put it the controller node
> > otherwise designware core node will not get it.
>
> I think it's better to put the PHY info, including num-lanes, in Root
> Port DT nodes now even thought the DWC core doesn't explicitly support
> that yet because it's much easier to change the DWC core and the
> driver code than it is to change the DT structure.
>
> That will mean a little extra code in the s32g driver now, but we will
> be able to remove that eventually.  If we leave the PHY in the DT
> controller node, we may eventually end up having to support two s32g
> DT structures: the single RP style with PHY in the controller, and a
> multiple RP style with PHY in the RP.
>
> We'll likely have both structures for many existing drivers, but I
> think it will be simpler if new drivers can avoid the old one.

Okay, i will add a RP node

>
> The eic7700 driver is an example of num-lanes support in the driver:
> https://lore.kernel.org/linux-pci/20251030083143.1341-1-zhangsenchuan@eswincomputing.com/
>
> Bjorn

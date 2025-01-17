Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDB925A62E
	for <imx@lists.linux.dev>; Fri, 17 Jan 2025 14:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737124524; cv=none; b=W6w/9xxOeznF/YHdLgyZPXkP7Fu3m9tgW4iFRPFDcvuha313L1s4PFCce2j2cVk/arJ2AtamIW2IFzeGJmIqWxBqjsooBakyWUUr2PutxqmLhum4TEW3kM06aC8IVz2HouOqRUzzBptP8nfsOwVigfJX4BiVJUuDHHL1QHMLiYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737124524; c=relaxed/simple;
	bh=U1bXD0ODsh6B+f9cW9Na6eWpJtnTitSgpx2BcKFtykI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ftZGfnZB8t91B6k78ffHzectC+srkCd9p1n0qcrb4pbjg72/ZHwmCBRE4TdAZL2fhpvgk0mlw+WvGqfUSl4F+5WzCFcEIe5oVtAeM9mPfAZFuFeCC7jrM3+uf8MOa+FToCGqfo1G4YHt0Un0kIbUwDHibJmEtqTt18q0qGeULmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VCm/bZla; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VCm/bZla"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163dc5155fso41788815ad.0
        for <imx@lists.linux.dev>; Fri, 17 Jan 2025 06:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737124522; x=1737729322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vlq3xrmJybNGHTlEg3leG0n0c2Nftdiq6DZq7VAdes8=;
        b=VCm/bZlaY0kbabnB9CMXS7fpEALkOMUCff/yfj+zq/jiNJIYyITqMnqLZ67J2Jwco1
         RFjjh7ME6647DI4KxL4YmKFVYxnTz39nPDkdgPWZPdJ094xb/QkJ8cQNLzMO6K8RHeUX
         GhKDtgApjTowaR/lbxA65DeyHU0Sw47TT+aI0QENt0+tFpU94N2Ecj2QRMostCZzSU7J
         DdEKudivBFOjKUe6Fcqc5QAFk3xndlMgQ6oHMeYR5WeGKg0u13IRRVBky6e2TX6D3PYa
         V3gINUsrcWk+Y3xhOJMo/jrbYNhPjv9nlPx0FvlasKfGtPQBMrdhYamyPscBvDW89Iw8
         SF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737124522; x=1737729322;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlq3xrmJybNGHTlEg3leG0n0c2Nftdiq6DZq7VAdes8=;
        b=jR+COx3mvoISKj9yDT351DK4IH2MrlBUuR8cNATRDjrTyi8o2pIqzzvD5wky5TrLyZ
         cu2X/4/WYWuFaqmxu8bK9CyagFRoaO62++9fmqhd/wjZIzPOu+NNw2Urr0Zld1+/4WaN
         H2fOLCgOr4s1Ygq0UgR39dN038pa680EtvNLUMFJjPGyGtdes6cDPdDPRw9L3zShDbiP
         diWc2XOkXhimuB/JYIl5ncstZKc4m2gaNcjcpC0Wc9o1Njc1UoUMKuPOsx9IwhW7Xaoz
         Aq/ExEDlnvHrnnkWenSdcKJje6UCfHbdxmpxaQ01ZyKDDiQ045sAEUqYF+Mz9oEqs6nn
         RV7g==
X-Forwarded-Encrypted: i=1; AJvYcCWhKylcDm4B+G+oyY+6+4mPQKt9mtekYCwTwdezqgdLRfu+ZgBdhsPTCX+MLkq7VK6jqtk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmPgGa+WJlUs/xZFgcLWRX5QPhR2mGRrqnaQoa7LBxkVQ2akjU
	///McJBozQtd432lSEdcHAWI/amy7tmgSzrWJtATbDJ61HNT2jUP38uZDLiKog==
X-Gm-Gg: ASbGnct97yvMZtf43OLI4mqi0+r5FHBmlOP/GOvMDnaOf5a4iMomy04FO3YZ0IN4aYS
	VEbRmjdcFXmExMHZAGVCFJPEHJTmiABfurBSoFWz6XqU8k56jY77PdtJHiIsLHfMCTWGBLS1xK4
	XQQTJxi7lRMgYP2GahJMpSOtCth2Z7vY2I8dxLjXuePKDUjoXO+q4OkzD5J/sVGwXeDiAnedRvR
	9Ay0CWjwAXx1Cbz5LkJVKiSIzpKGd72lmgpsS81AvMCuNTlXfHCaJko
X-Google-Smtp-Source: AGHT+IHlB551XWZHdO9O4WS29tWteAQIvgFmi288a2C7lARMeFn9tDysn3gpdV4PSXFUwKhBO9Rkhw==
X-Received: by 2002:a17:903:2284:b0:215:ac55:fd72 with SMTP id d9443c01a7336-21c355e3500mr41887205ad.37.1737124521909;
        Fri, 17 Jan 2025 06:35:21 -0800 (PST)
Received: from ?IPv6:::1? ([2409:40f4:3042:3329:8000::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3a883asm16599625ad.151.2025.01.17.06.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 06:35:21 -0800 (PST)
Date: Fri, 17 Jan 2025 20:05:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>, Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v8_3/7=5D_PCI=3A_dwc=3A_ep=3A_Ad?=
 =?US-ASCII?Q?d_bus=5Faddr=5Fbase_for_outbound_window?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250116224902.GA614046@bhelgaas>
References: <20250116224902.GA614046@bhelgaas>
Message-ID: <266CE37A-A50B-498F-8BE7-5D6449F72E5B@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On January 17, 2025 4:19:02 AM GMT+05:30, Bjorn Helgaas <helgaas@kernel=2E=
org> wrote:
>On Thu, Jan 16, 2025 at 03:02:44PM -0500, Frank Li wrote:
>> On Thu, Jan 16, 2025 at 01:45:58PM -0600, Bjorn Helgaas wrote:
>> > On Thu, Jan 16, 2025 at 01:04:16PM -0500, Frank Li wrote:
>> > > On Thu, Jan 16, 2025 at 09:32:39AM -0600, Bjorn Helgaas wrote:
>> > > > On Tue, Nov 19, 2024 at 02:44:21PM -0500, Frank Li wrote:
>> > > > >                    Endpoint
>> > > > >   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=90
>> > > > >   =E2=94=82                             pcie-ep@5f010000  =E2=
=94=82
>> > > > >   =E2=94=82                             =E2=94=8C=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90=E2=94=82
>> > > > >   =E2=94=82                             =E2=94=82   Endpoint   =
  =E2=94=82=E2=94=82
>> > > > >   =E2=94=82                             =E2=94=82   PCIe       =
  =E2=94=82=E2=94=82
>> > > > >   =E2=94=82                             =E2=94=82   Controller =
  =E2=94=82=E2=94=82
>> > > > >   =E2=94=82           bus@5f000000      =E2=94=82              =
  =E2=94=82=E2=94=82
>> > > > >   =E2=94=82           =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90      =
=E2=94=82                =E2=94=82=E2=94=82
>> > > > >   =E2=94=82           =E2=94=82          =E2=94=82 Outbound Tra=
nsfer     =E2=94=82=E2=94=82
>> > > > >   =E2=94=82=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=90    =E2=94=82  Bus     =E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=96=BA=E2=94=82 ATU  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=AC=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BA
>> > > > >   =E2=94=82=E2=94=82     =E2=94=82    =E2=94=82  Fabric  =E2=94=
=82Bus   =E2=94=82                =E2=94=82=E2=94=82PCI Addr
>> > > > >   =E2=94=82=E2=94=82 CPU =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=
=E2=96=BA=E2=94=82          =E2=94=82Addr  =E2=94=82                =E2=94=
=82=E2=94=820xA000_0000
>> > > > >   =E2=94=82=E2=94=82     =E2=94=82CPU =E2=94=82          =E2=94=
=820x8000_0000            =E2=94=82=E2=94=82
>> > > > >   =E2=94=82=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=98Addr=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =E2=94=82         =
       =E2=94=82=E2=94=82
>> > > > >   =E2=94=82       0x7000_0000           =E2=94=94=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98=E2=94=82
>> > > > >   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=98
>> > > > >
>> > > > > Use 'ranges' property in DT to configure the iATU outbound wind=
ow address=2E
>> > > > > The bus fabric generally passes the same address to the PCIe EP=
 controller,
>> > > > > but some bus fabrics map the address before sending it to the P=
CIe EP
>> > > > > controller=2E
>> > > > >
>> > > > > Above diagram, CPU write data to outbound windows address 0x700=
0_0000, Bus
>> > > > > fabric map it to 0x8000_0000=2E ATU should use bus address 0x80=
00_0000 as
>> > > > > input address and map to PCI address 0xA000_0000=2E
>> > > > >
>> > > > > Previously, 'cpu_addr_fixup()' was used to handle address conve=
rsion=2E Now,
>> > > > > the device tree provides this information, preferring a common =
method=2E
>> > > > >
>> > > > > bus@5f000000 {
>> > > > > 	compatible =3D "simple-bus";
>> > > > > 	ranges =3D <0x80000000 0x0 0x70000000 0x10000000>;
>> > > > >
>> > > > > 	pcie-ep@5f010000 {
>> > > > > 		reg =3D <0x80000000 0x10000000>;
>> > > > > 		reg-names =3D"addr_space";
>> > > > > 		=2E=2E=2E
>> > > > > 	};
>> > > > > 	=2E=2E=2E
>> > > > > };
>> > > > >
>> > > > > 'ranges' in bus@5f000000 descript how address map from CPU addr=
ess to bus
>> > > > > address=2E
>> > > >
>> > > > Shouldn't there also be a pcie-ep@5f010000 'ranges' property to
>> > > > describe the translation for the window from bus addr 0x8000_0000=
 to
>> > > > PCI addr 0xA000_0000?
>> > >
>> > > Needn't 'ranges' under pcie-ep@5f010000 because history reason=2E D=
WC use
>> > > reg-names "addr_space" descript outbound windows space=2E
>> >
>> > If reg-name "addr_space" is used instead of 'ranges' for some
>> > historical reason, we should mention that in the commit log so people
>> > don't assume that this difference is the way it's *supposed* to be
>> > done=2E
>>=20
>> How about add comments after
>>=20
>> reg-names =3D"addr_space"; // Indicate EP outbound windows space instea=
d use
>> ranges by histortical reason=2E
>
>OK, that seems reasonable=2E
>

Unfortunately not=2E Please see below=2E

>Where does the 0xA000_0000 PCI address come from?  I assume that's in
>DT somewhere too?
>

No, PCI address is from host address space, hence it cannot be described i=
n DT=2E That's the reason why 'addr_space' reg property is used to define o=
utbound window region=2E iATU will map the host PCI address to endpoint out=
bound window region dynamically based on usecase (like mapping the buffer i=
n host address space)=2E

The translation between CPU:BUS address space is a hardware property, henc=
e using 'ranges' to describe them makes sense=2E

But the same cannot be applied for BUS:PCI address space=2E Maybe the diag=
ram had misled you thinking that PCI address is also static=2E

- Mani

>Is there a binding in the tree that would take advantage of this patch
>that I can look at?  arch/arm64/boot/dts/freescale/imx8-ss-hsio=2Edtsi=20
>has bus@5f000000 that does this translation, but I don't see any
>endpoint mode that uses it=2E
>
>> > > All regs need call of_property_read_reg() to get untranslated addre=
ss=2E
>> > > ranges:  use "parent_bus_addr" in [1]=2E
>> >
>> > I think we should at least use the same name ("parent_bus_addr", not
>> > "bus_addr_base") and probably also figure out a wrapper or similar wa=
y
>> > to use 'ranges' for future endpoint drivers and fall back to
>> > "addr_space" for DWC=2E
>>=20
>> Okay for name parent_bus_addr=2E
>> Do you need me to respin it? Or you change it by yourself?
>
>I can do that=2E
>
>Bjorn
>
>> > > > [1] https://lore=2Ekernel=2Eorg/r/20241119-pci_fixup_addr-v8-1-c4=
bfa5193288@nxp=2Ecom

=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

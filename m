Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3201F19E80F
	for <imx@lists.linux.dev>; Tue, 27 Aug 2024 10:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724753991; cv=none; b=YdL5vU6MrMLEQ/F3FDMiFlxvrS8Awy2tmRSe32UBehQXdc5wXHO0wRjropJCIp13WBG5/kXKhZVLTOG/+MJXqtVbpXIDYHFi8QN+/PJOB8IDrkFTaVRPjfL7xknZysBMP7atEsqkhkX1ZxxQsD6ShXbr3JYMyprG9CfL6sA2rl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724753991; c=relaxed/simple;
	bh=sK07lsSFE+joTxGjfjUxjVBL45qEzvwR3njHZpcid4w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K64PAUvNskOWOYhCAx/C2DN0tgOEccH8vRJuxWLSlQCA+85M1RO6kwxCj7sCAOb+jzATgDYyli4hqmiXSOZt5U1fU+vDC+a0GKrFgoe118bBWMf0uXLlkBJDDx1I2bKzzrGWpK4+HZAeVUMbAte2z/iYsEIKtbqWFOt9LFc6GaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=H+JLuay5; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=N+LTt4NS reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="H+JLuay5";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="N+LTt4NS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1724753988; x=1756289988;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sK07lsSFE+joTxGjfjUxjVBL45qEzvwR3njHZpcid4w=;
  b=H+JLuay5CO3R0p+g9nV8B2GFWdMZs8tvGALHLO1AdOjUajHtuxAvb0mT
   1dP3nlQ0LOcvAr2tFspraP87rYDreyMqmXx9tDiir9SpnLDcTuL3l5woG
   yDBAfYGjMO/mRTMukj1iRuL2VyVyNyycgf7KJC6mMqTcq3TPA+ovNo2KQ
   MaDkx7mCI0GsjImX2mKVjYdRln82Jv8baOj5bN2sh8ofYYrdKZoPSDyLv
   BE8r//yFSNACaXyOBIF6Ao453R0j4SISB+qkcH7rCsSH7jvfarGO87AqH
   oTOKGyujhgL759DUNhBB2cW6d1XvziP0yTv+IOsnxtu+BFCZRcmDphP+h
   A==;
X-CSE-ConnectionGUID: jAaQfSicRt6iEjmCMN9BRg==
X-CSE-MsgGUID: mFTZQZw8TmqdYetBsj8TFw==
X-IronPort-AV: E=Sophos;i="6.10,180,1719871200"; 
   d="scan'208";a="38608163"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Aug 2024 12:19:45 +0200
X-CheckPoint: {66CDA841-3-AFDE3C8E-D8665302}
X-MAIL-CPID: 19D5DE844FDF028A42682B9DDEF1DD6E_4
X-Control-Analysis: str=0001.0A782F1C.66CDA841.0037,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6CDA816137E;
	Tue, 27 Aug 2024 12:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1724753980; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sK07lsSFE+joTxGjfjUxjVBL45qEzvwR3njHZpcid4w=;
	b=N+LTt4NSfebstkSn8ZH9nH0PBJvZdiDr4ROF0YMVrBLnn5CtpCltt0ARBcSMfaL3F00oE2
	2G5rEBZXsJEeXW84vYsu+4nDfY1qo3IrcVDq3xtUfS+wsQMAtkdAQazFzlJ1sFENdSVmyA
	btVUfWuhg5QiLqlfFFLTF4MEOPEGfdsbjWMeyKdKcvf2Ku9Sfz1v4dXkv/qQvoI+XdLB3+
	zXK18Mg9R79YzDFwKWQrBpCXpNUEAK+P4Q32+dU78CxbmKyCyYMUXqlsE4QLEXlyK4EUSd
	bal4xcg9vCAQclLyGl14fA4ZkSZe04nypCIPvHMRiWkrTjPtu08gHw08OMItxQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: gregor.herburger@ew.tq-group.com, imx@lists.linux.dev, Frank Li <Frank.li@nxp.com>
Subject: Re: About fsl-lx2160a-tqmlx2160a
Date: Tue, 27 Aug 2024 12:19:40 +0200
Message-ID: <4596109.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Zsz7OMOUpiC1vi9l@lizhi-Precision-Tower-5810>
References: <Zsz7OMOUpiC1vi9l@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Frank,

Am Dienstag, 27. August 2024, 00:01:28 CEST schrieb Frank Li:
> In https://lore.kernel.org/imx/20240826-2160r2-v1-2-106340d538d6@nxp.com/=
#R
>=20
> I try correct lx2160 pci for Rev2 chip. I saw fsl-lx2160a-tqmlx2160a.dtsi
> added at 2023, I supposed you use lx2160 Rev2 chips because Rev1 chip only
> was sent out for evaulation at very beginning phase.
>=20
> Can you help confirm you use rev2 chip?

I checked the used revisions on the board revisions I could find. Here is a
list of parts being used:

PLX2160PC72229B
PLX2160PC72229B
 LX2160XE72029B
 LX2160XC72232B

According to RM Rev3 part numbering nomenclature these all should be Rev 2.0
(trailing B for revision).

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



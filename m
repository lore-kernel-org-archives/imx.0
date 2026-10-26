Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033993;
	b=TCA0uY/lcKvIfDc021q2wP2DBpS4VlSCeTEQtqwvlEcUwEjelQ3klsHaMF8vO6K/Q0E0
	 U1v2VYn8VAgy0cdlVtNlTrc0i7prY/xfqnIIZBeJg2B3CN12hFyUuGJNQ9CybrqGi25hN
	 Lt6OU6NliN7Vbh41RvG0lv1UUCfTBH8F1ZG2DDuvfZdULvnKoKRxMb8P6lzgJbNV2tMWl
	 MbiiOCehC48QA7OnRV7qITp4hmrLzGEeUczPSkbS00upa84cfyMyMq6QRm5PCMfzlXkIT
	 lJXw9chjklhhNDW0ugQHuHqlCLGIXKiEoYcbnbrd0GYE3hcS93dmqma5Zq0aGlFU15A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BBemIOG3KuKqxJ/h5u8qdNoWNATVBlUDjRGyS3stVBE=;
	b=3goZofyG61vW5wVdixzxuQA4Mcjb+y5CnHWK3EuKzbIuFarZuYE8IERq1RrxToeKN4jg
	 tWCU7POzdu7rQVPdrHf9ZbZcGzKvbl0nWSwtAkFQq0W1giajrROPkQeS+LP/4BSjTQkVW
	 WnytD21nrWYdaWUGvIcCUXFrC4WK2hU+rc4A0Cd1l9ZU3/yk1uyzQ0zFjp5rUnfVtsAX4
	 s34GmhAe2lC693xRNKLAB2BN2Jtf1ZUxieEKEnpesX7H8f4NI3kAys2tJSC7gua3str0D
	 jMHGh6Kp9VsyvKRqa0yh0tPwSXc48ivKihbpWzygcziYZxv1m5qzooJSAt9s6hpY2uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LsT0rVBu;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1B6606A31A
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 16:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B1B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LsT0rVBu
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1675413f8f.3
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 09:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793033991; x=1793638791; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBemIOG3KuKqxJ/h5u8qdNoWNATVBlUDjRGyS3stVBE=;
        b=LsT0rVBuzuKdk4SSRhROXXnKs9day3uFvMwtz5gPuKi6VEtc+0nZ9i/fejmp83C4rA
         Eib9tsUKxkujQu9z+IgCWAV6u1X4ixUDKhaQMsowlxZaRxJ/+afgZJ5Bq/rYYPYvLdRA
         xlYey+8ySgPwMxOwK/e2ogdhrU9YCecAfxtIQ3M0x6lZLONmz2Dce3kBLevLY6b6j0z5
         SwBSRUsJRvUB68M0MP1VKgrKzEUHzTqRJ5QBAKATvvAeRMn+r/7+pa9MgaNTeUtCFEYx
         pThtrXYwENfYmfKAJ9hhOFMi619LnPuNWU28SA6vcuC+AbxId/6RmMjde2R6b0EYril4
         0kXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033991; x=1793638791;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BBemIOG3KuKqxJ/h5u8qdNoWNATVBlUDjRGyS3stVBE=;
        b=GjG4HLViYJRcTEYdD7vlJmCC3gE3dYD9F0VuLQaArEEjWjY+Wc+PpNgCwGmvI/OlVl
         DjPDATRLAz/vtY6mhvyOAWYWQl7/Flzg2MLVHq2TvNj4s2o5SpxM/6KEbrrIufgD20NH
         S+DPpTY91fCY8kMB6oFigIt5MbtVvmSCtnrtiToEhrArXMJAuVfsQqrSFgePZwMK4Z3M
         CCNU8MEP9oKeCSorZ13jZ06P/eKWpw2GZt4Q+1VqS4zL3+XgjC4vrG7TFs6lrOt2xkg8
         8oJCMoycdo2/G/3gft/9vuT60/8WC0DTG2OaOoJAgpeRIrw9x55LrLVp88Hiu1jOABG/
         2bGQ==
X-Forwarded-Encrypted: i=1; AKwUvByHbQMO6meQ0AEZRC05C2SD/WmQcwUqvRTArVYyafXLmg9JMugcZF8yt1TA/tIe4DwdF7U=@lists.linux.dev
X-Gm-Message-State: AFq9FYLcETNWErG3lIPogf3JiA8ZVkU+lW37bXctP8c3pIfp7C10csB4
	MbYu1R38p9/2BbXy/oWddk8YzMoiZDqpPzP6lA6PU17eGb4b7MvIiTnj
X-Gm-Gg: AYBFou0ipDfpow2phfbQztezJLKhl/qxpWQRJxmIqYT8ELOpJ+UZH1RNY7YcheIK1ag
	bpgBivgBN7iYRH++URWMDQZW4kPVS+oxr+B/hT44UpAgsNx6Mxr/TKuRS8HfoISw4m649DIrUjD
	bqtEt/wG7ZUsEJrpP4viD5tVCmoi6IE5ow/CWLy6qTbhvkQ5UrzOn6vRP0sWUtqRI5jzAqWfZAd
	FFVFx5GA09gQoxZbr1uG7jx3MCfh/oUC3xUrFGME3Th+oNyvAPFcGlxVehfBhs48CetHkQhhT9n
	59cyhR6+PQM4ZSlpm0uoOIjrDM317owcSU0zRJYNq8b802QT+X6brDsl66CjrHyExlgMBctCg9v
	vxUaw9HFz77iq2UHnxaKP/AFoDEpln+rp0vJubkTdD0P89Upa3FO3Domir4VJPNEwMIoF361DrO
	aUbDlXUhP8SkzFO2+IvJU10rVXm0fIqqNiQANGZ6C1zgKeXpVsFlj3cB8E4ml2yPmxbVtwanP2Q
	7y6mxMYLoCL67b0EWtUGVtwrmi97xKDzzPBP00g8P22XX12mg1vSGOPayUHUPyGd9TogmAuQKCZ
	0lmSLcPOCzqdmGCc0zhFf7kRuKRFYbPGTIrhx/qpwlDNLsIE2HXfBuSG5fLY4D2g3V+TxALFx+F
	YwCtd7Q==
X-Received: by 2002:a05:6000:4021:b0:486:f42f:6860 with SMTP id ffacd0b85a97d-48e3eba4d70mr13645153f8f.56.1793033991164;
        Mon, 26 Oct 2026 09:59:51 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm17405886f8f.34.2026.10.26.09.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:59:50 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:59:47 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	Stefano Radaelli <stefano.r@variscite.com>,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	pierluigi.p@variscite.com, Nate.D@variscite.com,
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [RFC] arm64: dts: freescale: Supporting Variscite SoM and
 carrier revisions
Message-ID: <at-HA7K_cWub_arR@GLaDOS.station>
References: <20261023115242.11197-1-stefano.r@variscite.com>
 <att6GNZAVv64Rlnv@SMW015318>
 <at8Pc9jDy0dX8Sr9@GLaDOS.station>
 <at-BsPCwPGlpnuJ5@SMW015318>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at-BsPCwPGlpnuJ5@SMW015318>

On Mon, Oct 26, 2026 at 11:37:04AM -0500, Frank Li wrote:
> 
> Is it for created dtb file? We generally doesn't finial results.
> 

I meant the source .dts filenames committed to the kernel tree,
as well as the resulting .dtb filenames.

Would a name such as imx8mm-var-dart-2.0-sonata-1.0.dts be acceptable
upstream, including both the SoM and carrier hardware revisions?
We would keep that filename unchanged when later compatible
revisions can use the same description.

> 
> It should be fine only if dts can be shared. It is okay to generate differe
> combination dtb file by using makefile.
> 

Thanks. Our proposed approach is to share the common and
revision-specific descriptions through .dtsi files, with small
top-level .dts files selecting the appropriate SoM/carrier
combination through includes. We would then list the corresponding
.dtb targets in the Makefile and compile them into complete DTBs
that the bootloader can load directly.

> 
> Yes, need revision-specific compatible string.
> 
> compatible = "SoM2.1-carrier-0.1", "SoMv2.0-carrier-0.2", ....
> 

Understood. When a new revision can share the existing description,
we would add its revision-specific compatible to the same DTS,
retain the existing strings, and update the corresponding binding.

For example, if SoM v2.1 on Sonata v1.0 can use the same description
as SoM v2.0 on Sonata v1.0, we would add the new compatible to the
existing DTS. The resulting DTB would continue to serve both
revisions under the same filename, provided that the description
and all declared compatibilities remain correct for both.

Thanks,
Stefano

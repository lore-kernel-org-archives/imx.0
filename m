Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011687;
	b=pS0h5zwPJtNVOaiODkbI7rbpmBuyBEAz2smY9XZ+AmP2fN4l2ictuTqvrQc8+0jp6vQS
	 /9eC4U2df2b9cISFBy5V7N27JgkZyAfChHPrvQK6TOwYFiZAm4Bv6B9vwzDT2Phw6//n0
	 /jHMWW1VWRltTSpJKanHv5gNOlz1ESWQgUlQlZw1CEJFQUD3N20C9vKEw6YYfXCmN7/td
	 N9a+Ybgq4hsMt6X3C2AyCEFNstaUyI7BKmmBORND5Y9nBxmRzLBbZYMwuTtVuZdIe1d/a
	 0XyUVSruC8ryBM7WYDfWJdXDes0ti6l787VbPjL1MENZxZPFS5kheBhmdpzsJJmjFVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011687;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=koOA3+uyeaO+yGsJ2lbzCEqTAi1LlA5ojHCIwS8nkFo=;
	b=zQDDBw9RmzDA9gpzfZ+XkBiaPu6N+e5k2MTyfLKe0sWdBsGZAr22huIQa0eOM2sJMe1X
	 rsrff5lEVEP21Z4HAVLpruKLv+7Sk6XG06u4/+Pa9jISgBp0+gbQv78kYOTwzX5jzlOUq
	 fOzlfK0hN0NXvN98VmbtfRrZ3mYcrpaNTYGYC/yRuDxwMMug7LQB7ThSqKclWaRVLsnCC
	 fS/xA6zWFM+vjUAeNYTidg4LiHQEC7iYF0y389+/J4A6mk1cHOV9zn6lVHil4OncLLY6l
	 kUtfZEeo86oIqPl4g8tiF/oLayreZ9TtTmZky7dRJ4Id0t9vWgb2CbmMtLmFirgobgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dVL28C5M;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5F7606A31C
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 14:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B5F7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dVL28C5M
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 81B6F4E4162A;
	Wed, 18 Nov 2026 14:21:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DF1B5FE9B;
	Wed, 18 Nov 2026 14:21:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4B4F11BC220F;
	Wed, 18 Nov 2026 15:21:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795011682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=koOA3+uyeaO+yGsJ2lbzCEqTAi1LlA5ojHCIwS8nkFo=;
	b=dVL28C5M1iHlKNScWIc5QWCr1TK41/mIj/V2RhQms8jF7udysTvfZ4qv5gXHQWnKKHvjji
	716dw/wiRDCo4DdhCb+X9kRImFyzJLmLNVc2BCSSCJ2Fhx9UbVlLVWTVHw/FVFx+4nO0a3
	KItzbMPit9xC2YA7EA4nvyN+o5LWK/iYTbFRL4FAKkHP+qtLYFxkcxS7oVIuASJIjFM5LK
	txYyTmtCN/cxpcbTHyMCx3Ey73rNzuz6wslYr5OgDyfZE50r+9iEQnp/Okyq3Y76DCJjRJ
	HMzpq08hP2mymX3psfhnf+0/QkQpZarZ6XuJxgXP2OP3Mh5Yur0a2o2DQn7c0w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <michael@walle.cc>
Cc: <haibo.chen@oss.nxp.com>,  "Pratyush Yadav" <pratyush@kernel.org>,
  "Michael Walle" <mwalle@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <imx@lists.linux.dev>,  "Haibo Chen" <haibo.chen@nxp.com>,
  <stable@vger.kernel.org>
Subject: Re: [PATCH v5] mtd: spi-nor: clear the default read_sr2 opcode for
 Octal DTR flashes
In-Reply-To: <DMYBR7I0R1PK.25FUNB24SPCFS@walle.cc> (Michael Walle's message of
	"Wed, 18 Nov 2026 13:10:38 +0100")
References: <20261023-spi-nor-fix-v5-1-bb6e0ce21169@nxp.com>
	<DMYBR7I0R1PK.25FUNB24SPCFS@walle.cc>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 15:21:17 +0100
Message-ID: <87h5hei5k2.fsf@bootlin.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 18/11/2026 at 13:10:38 +01, "Michael Walle" <michael@walle.cc> wrote:

> On Fri Oct 23, 2026 at 9:11 AM CEST, haibo.chen wrote:
>> From: Haibo Chen <haibo.chen@nxp.com>
>>
>> The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35), and
>> spi_nor_cache_sr_lock_bits() reads SR2 during spi_nor_init(), i.e. after
>> the flash has been switched to its runtime protocol. On an octal flash
>> running in 8D-8D-8D mode the opcode is extended per cmd_ext_type (e.g.
>> 0x3535), but RDCR is not a valid register read there: these parts access
>> their status/configuration registers through a vendor-specific indirect
>> space, if at all. The flash does not answer, the register read times out
>> and probe (or resume) fails (on i.MX FlexSPI: -ETIMEDOUT and a controller
>> WARN(), seen with a Micron MT35XU01G and a Macronix MX25UW51345G).
>>
>> Clear read_sr2 on every path that enables 8D-8D-8D, so that
>> spi_nor_read_sr1_and_sr2() degrades to an SR1-only read and no
>> unsupported command is issued. A manufacturer driver that genuinely
>> needs an SR2 read in this mode can still install its own opcode in a
>> later fixup.
>>
>> - spi_nor_parse_profile1(): the common case. The xSPI Profile 1.0 table
>>   does not describe any SR2/RDCR read, and it runs before the
>>   manufacturer late_init.
>> - mt35xu512aba_post_sfdp_fixup(): some mt35xu512aba batches lack the
>>   Profile 1.0 table and enable 8D here instead, with the BFPT QER field
>>   left at a reserved value so read_sr2 keeps its RDCR default.
>> - spi_nor_no_sfdp_init_params(): non-SFDP parts that enable 8D via
>>   SPI_NOR_OCTAL_DTR_READ keep the RDCR default too.
>>
>> CMP (the only user of SR2 beyond quad-enable in the locking code) is
>> Winbond-specific and is not placed in SR2 on their 8D-capable parts, so
>> no octal flash loses a usable SR2 read because of this change.
>>
>> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status su=
pport")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
>
> Miquel, if you want to pick it yourself for fixes, otherwise I can
> also push it there.
>
> In any case,
>
> Acked-by: Michael Walle <mwalle@kernel.org>

Sorry, I'm used to be the only one doing that job. Please do it.

Miqu=C3=A8l

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728499;
	b=bRdEIIEEhWhCiwZFsu49SK4ICdsHnlbjYzpmxyyM6XVHcBXi1bkxkzkWpGOTMy5GW70K
	 I5fR66UBUXZ5Wo1/Ya4OeN1WBKWBUKPWEeMvjYg4x96eL9waeH96UJOesbbam4r6Pstf3
	 djmdAz7D2WP2HgFIpEfEtMVRXf0itQCZYVQWOYZcMIgH1q6Wp2N24OKqhN9mBW1CJiGMG
	 IjvESHRRTyx5eP6oJg1R8NTdQlhoQghlsWk/JpBSfKYvGfbpuHGQvVwVQDzD6Azxt+uP0
	 2ISl6QopBBCQnYuafca+9X8YcnhkIBqec4lbyCEBqmi8dN6pu7LbVlAJ3cu3B3jvaKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jZ2Sjnmva/1htB7cpZpW/gcylRyyS5ZoZAy+/1hlRFI=;
	b=Qa64AUu0+Sv1+DWX5dV2UeEa4uMw5nqJBVQshLB1Kk7Sn53+vmRvMrUF0QfgyPTbf/0b
	 bkne/SZqi51i/z/dclbcWlK/L4cCXok0VI6vsin4GkDlz/l4PZbvVwKATInWUK10NUVLj
	 tNVJRbsNSUDBKnmCmBs9mA5H539Agi0sgllzniR/7FCwRh16bH14JKLenP+nV87ft94ap
	 JpQOuIi7Gk2RdmUxsCyWSsogzVJtqSUhQDtyVyxB6kMneFWMckxMy/kiOQOJSttK5wmmC
	 TOM/eHDfcEKMPMfHW8jZL3M30fZrSZJoW9UNuCPrVPeLFQPP9ZdfyUX6x4sNIZu2aVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=flZZ7cHz;
	arc=none smtp.remote-ip=199.89.1.16
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A89606A32E
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 17:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A89606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=flZZ7cHz
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4jJx6p483KzlfvpW;
	Tue,  3 Nov 2026 17:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1793728495; x=1796320496; bh=jZ2Sjnmva/1htB7cpZpW/gcy
	lRyyS5ZoZAy+/1hlRFI=; b=flZZ7cHzTCDG/nu9oQ45c+NsjOqwMC6iizKxC1gr
	T5r4aYGCm3zOfBYHAJTF/Cp6HAFUH2KsCf2SY2JbUWeIMZEPnt8fcyi6+znnxaD4
	pBLu1tdAZCbtU8GkwXdy+RA3uPvPX6uyPvdV90emcGb/qKB3LokPl6aMb85moejd
	68erAA70XBFBAMDDbQKacoY9ROZ7oB9ltegU631OznS4xGgySaFEkJcSyDDY1P0K
	5kpi4f6ko8GJ/Jyn+ZxUn64QEMIeE0r+TxDiubLUPoydMgWA+d1MS+LtOJZPhRVI
	DOBY1pfzyFHl/yw65tLLJkpd2kB6E/J4RGoucUW4WZyWOQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id CujC287P7Lpf; Tue,  3 Nov 2026 17:54:55 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:b098:ee7:dc7c:db4e] (unknown [104.135.182.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4jJx6k3x90zlfvpc;
	Tue,  3 Nov 2026 17:54:54 +0000 (UTC)
Message-ID: <0dfb2967-0302-413a-9b50-96fae60b825e@acm.org>
Date: Tue, 3 Nov 2026 09:54:53 -0800
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/11] ufs: unipro: Add TX/RX FSM state attributes
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Ajay Neeli <ajay.neeli@amd.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Pedro Sousa <pedrom.sousa@synopsys.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Can Guo <quic_cang@quicinc.com>,
 Asutosh Das <quic_asutoshd@quicinc.com>
Cc: imx@lists.linux.dev, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com, Frank Li <Frank.Li@nxp.com>
References: <20261103133215.1385823-1-larisa.grigore@oss.nxp.com>
 <20261103133215.1385823-5-larisa.grigore@oss.nxp.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261103133215.1385823-5-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 5:32 AM, Larisa Grigore wrote:
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

The submitter's Signed-off-by should come last. Otherwise this patch
looks good to me. Hence:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


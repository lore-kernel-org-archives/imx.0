Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728430;
	b=UExz+sdfVG0PueA4zdDNK5J/7XEmcgb5qQk5Ra4LJ9H6kDC31xe9fX3BLHbLQlE5Zdxd
	 ZMu5da86BdOzBiACiB7wz6caU6y4aEM8Lgn+uv5j9EWnQ7lOzDAClr1iWwuXdEH8ruVbB
	 UNQAXfSLUtKL+58cShzXUeFpPHUetObtg0Jscjeyu1apaQHdrDliZDJzaI4YUrHmqHBhl
	 e/Myuiai6oAemXll7HVOdVkrMuv024JNU922smjXsKj++h+VCiNu+GWwvn6oiXXTOZRhk
	 2aV04BKEClCpl/1BK3hHBWn5YLNTA7AcHdoEGmS/4VI22TNz9EmcKa1SWgm/yXtdS0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nv/S8+4XbDZcebn2R51IJieAKP1m3RtJvkfF3QMxym4=;
	b=jr8yLxaAF/sVyTnNJ2csU6BlFzO2HiCr+XgMr7HuWDKVAUAT+oRPXkf3Pm7uBZ8kCqAj
	 UUorf09OVYDrwf+rNuL2bMyZIJTAYwWcEn1hwh7Gb24RTzqMxB8FG87NOULWESKSQC4Ps
	 fDMFT4Bx9yQhzPsUEKP+e8JOif9paK+WSQy2VcnkKo2l732O4qlbCbMmAu/K8H5kk/fz5
	 i+Ap6jLF59LtdkTZaHrIBtE+QEmUJNp6TZiHSFRmip+wOSV0n+xfluvHbjesvTBh9919R
	 xrXUcUCTlIpUikxQ/eMxQG9CSVgsgfcBh/iGRcy+Jl6BaNTwE1vH1boXgi81J86OrHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=r8YfTIAk;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72419606A31B
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 17:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72419606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=r8YfTIAk
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJx5S5T4Rz1XLktx;
	Tue,  3 Nov 2026 17:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1793728424; x=1796320425; bh=nv/S8+4XbDZcebn2R51IJieA
	KP1m3RtJvkfF3QMxym4=; b=r8YfTIAkCYBU4vtqIaBhFbgBI53QY2dlipL8p6MZ
	R6N+cyOsOyihZHkfJVGt/cWCcM8VzMaYn4V8rdyg66wOEzSsHPsKAA6nxPgtC1L3
	GrdU9a0qyA62toxXqekrxhMxPtFtaCuZJgXdfRmFdpt8rGrVArYfZjPvr6ieWLa1
	XiAIh4APqPCF47YiOJNJvv8GQN+r0zjy7qtDT6pAOnYYIKu9UYQffw50or9sOYii
	zTh1xLotom9/E8WepKxW8Z4bSJFwZeT1PN/E4KNbwuhw8vdoq6TrmfyHTIJkTmrt
	e1TlWUBryytPkLD6gKwama66XixRoa6zBL19NfJUgN+F5A==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id P6WlHWsK3ueh; Tue,  3 Nov 2026 17:53:44 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2ed2:d:b098:ee7:dc7c:db4e] (unknown [104.135.182.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJx5M4wVSz1XLkvj;
	Tue,  3 Nov 2026 17:53:43 +0000 (UTC)
Message-ID: <a608e18b-30a1-4c26-a456-c6b219d4a517@acm.org>
Date: Tue, 3 Nov 2026 09:53:42 -0800
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
Subject: Re: [PATCH v10 01/11] ufs: core: Return a negative errno from WLUN
 suspend/resume
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
 eballetb@redhat.com, echanude@redhat.com
References: <20261103133215.1385823-1-larisa.grigore@oss.nxp.com>
 <20261103133215.1385823-2-larisa.grigore@oss.nxp.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20261103133215.1385823-2-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 5:32 AM, Larisa Grigore wrote:
> __ufshcd_wl_suspend() and __ufshcd_wl_resume() may return a positive result
> code, e.g. from ufshcd_link_startup() when DME link startup fails while
> restoring the link.
> 
> The runtime PM core treats any non-zero value as a failure of the WLUN,
> but rpm_get_suppliers() only checks for a negative value. The LUs
> consuming the WLUN are thus reported as resumed and receive I/O while
> the WLUN is still suspended.
> 
> Convert positive values to -EIO, as ufshcd_init() already does.
> Do the same in __ufshcd_wl_suspend() for consistency, so that callers
> always get a negative errno.
Reviewed-by: Bart Van Assche <bvanassche@acm.org>


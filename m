Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116245;
	b=iQpOQ45L7cxYX+L8f6/izYc0K08RQ93I+vqzVGC2nyQxd2EKZ4Ralu+ohPPKxO3BwXTs
	 pm1NtXqc9R97DJSnCnXkvamytc4JaL9ePw7b3LtbzfLe5f3pR1RLHFtpARpQFQr0+/mSA
	 vTTCK1nQQ4M92M8JWLyem6EjTvtn1u+MNCYUWuE9wrZ7hVTxKuOH79MlDxY7ga75RxkJa
	 2n4Sbh5uqheS3pDtCq1NAIxkMZbnpB4icnadZ39WmPCfKwZ3REZL4bmIt5tdMwfC8V/A0
	 MY2n+Auz3pUUTtO2G7ZaheGdP0Mxp7AGU69VpZloYmogT1ZIBYPQMmzXDN6Z/frcFPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3EmMXFW21R4wDDI6QCAxEHbuFnBmRN+vpQa5TJPrlWU=;
	b=JJQkDKMx70NB+s0PNOuh1F8pzBx4Diuz0FTKFyMMnM2eDPzV56UFu2qowuXfGHl8sgEI
	 Md2lCoKOH/4fsNXDd88WEGOThTvXddiKSHcqmj+GZfTetGdkVb4S6kb0sqFQF+av6Gswo
	 XULrCZJnxOcnu1elE426cOqxoBzZH7t/4bSefxbjsGoZwyeCmatHPPgeK8VTkfi3O3+bf
	 jJfwjuyabPikqyPWVRFvcJ9GEUbwrJavoONWDjWOB2oX7VZg1ytwrDwPc1Q7YQ+ZQ5h0m
	 ofs3d94BLtAOgIpKeD3Db+S8WIOQ4+fvK3qba50GmIXomqw6T6VqSHP6xr49EWoOvoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TqXUg9Sy;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA85606A32D
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 15:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA85606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TqXUg9Sy
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so58928a12.0
        for <imx@lists.linux.dev>; Tue, 27 Oct 2026 08:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793116244; x=1793721044; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3EmMXFW21R4wDDI6QCAxEHbuFnBmRN+vpQa5TJPrlWU=;
        b=TqXUg9SySFXMw4+lZsHCBhpRWixDrdSexc3aAOu/7ZEjiXt7ouuK//Cb6f10K2/yHJ
         lQlIf4p7YcXkO1LsBPHEtxMopw7kmDE/9xJaK/XdOrZqc69OM7ikwUsPJZnkwmU9cAQp
         Ed9747E/4P+NyTcltfthwz99xO73Dh35L4DdvWP2HhdVYWXQiy9BBCna0YUorXDTTLsy
         vHMPjpYKnX44ZptRQgPSIcGLMae7BW86NP2qO3faZ8phxxuv1YhUo0noVsmPU35mm/Df
         hklijOqyg2q0xUTiBkYNN3ogIIt9i3aaCIUgNwa0YoHxeQybsLX95d+9clkxxjGJLRHI
         Tu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116244; x=1793721044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EmMXFW21R4wDDI6QCAxEHbuFnBmRN+vpQa5TJPrlWU=;
        b=kjSH66GjfA/NSf6l76aDcaUZM0LbXG6ESRBFSUYUqoVLsI81dKxANbJA2HFLmD5esE
         EBigpgGrn6jpBGT1eBZtm8yXlG1XVEMQdaTmRS2dsTlJYCfKhRiuX3clukR/a37i09nW
         hsaCoGk06rK6oW07TlIo/GigRaHdviyJvKinXtzStUdqRFAkNJ48ICuXTTGaTBEKvQwm
         zOUF0ijpQ9dyDWzNUzLsqOOxn7HKXevJ1sa+VTG8Ta9Y9GiV0hvtgYmhD6GLEJb8Zjya
         CdcsJLIvXd4aM0imssbWA6BxyDiy09LQUSk78wN7bOfhuAlANPGm12wUfTqLTnqRDaDz
         KhCA==
X-Forwarded-Encrypted: i=1; AKwUvBwAnpe7xv3/Y5m/cqU7FewwcVVC0+taIuBcqo9SEBkqeU1VysScJjrQLhUzdWCwHuqxOAA=@lists.linux.dev
X-Gm-Message-State: AFq9FYITKum6LEW1fNK+KcO6kxrBJRem011Gkn7It7sPYrQK3TjlHJ38
	4cHSoRmkeUaXO/WdFNyORkn7sgs5M73wPzCIkh/91EE0RsFCE5BdPiPlVA5rzkPmTUY=
X-Gm-Gg: AYBFou2bmPgheXk2yKp3uQXwvVvzbNibCpfT7u/zIIt29n/phJ7z0CbgzpefruKfECF
	dtO/kngAku0ADCPImAPWzaYfpSSmLDdShvQdv+4wX+SH7toZA5xIBfbBrPVTh9Nn5z8GNiPSt94
	lx6NviE5BnjKg4wfjU20+7CT3CDloPaQySCAh2T6Z1gssxIqVOo9qCJruL7HYGhqrHdRr97mC48
	ZLv8JSva7BD5qwi7jfvcT+5l25Xla2ffZF9L8TrYAT5ai4daxpB+NPdBcke9mEaFUnNyoG57Nou
	oPTS4PukxALwXBqhA7fMB3Z8B9hfi6oSQ04vVojRTg7tgQDQENWXIVYYKhsF4Cpl+rBJmSCsCsk
	jiMtm6d4FGLaSFenXI/HMMUdklTU8ZFRMwHtUh9oAIfoUrFqFbF7p/IiAJj1NT+KQut0yxnB2A8
	aOR01h/q8qOZXueAPd98kn4nmg3LcuITSxd5v6idy4rBtSHLN7kvLecBFfUyEaOT98LXA4zQhkp
	KG0MqQgmLqesy8naMMSQDTYUMJXfk+ScQ4R5OHOGhJpxparJ+JAHEVh6+I=
X-Received: by 2002:a05:6300:6bc9:b0:3e1:bd77:2c92 with SMTP id adf61e73a8af0-3e7cd4cbe1bmr6742323637.68.1793116244485;
        Tue, 27 Oct 2026 08:50:44 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c0a5:5d28:58c5:eac9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc666d1sm2943517a12.16.2026.10.27.08.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:50:43 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:50:41 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH v9 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid implicit ABI.
Message-ID: <auDIUf6Vx3VdeXcz@p14s>
References: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
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
In-Reply-To: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>

I will apply this patchset when 7.4-rc1 comes out.

Thanks,
Mathieu

On Fri, Oct 23, 2026 at 03:52:48PM -0400, Frank.Li@oss.nxp.com wrote:
> The driver currently derives the memory region type from the referenced
> memory node name, creating a implicit DT ABI.
> 
> rsc_table: rsc-table@90000000
>            ^^^^^^^^
> {	ret  = <0x90000000>;
> 	no-map;
> }
> 
> m4 {
> 	...
> 	memory-region = <&rsc_table>;
> }
> 
> Current require node name have to be rsc-table, but no any binding doc
> to restrict it.
> 
> Since memory node names are not constrained by the binding, incorrect names
> can silently pass DT validation, as seen in examples using "vdevbuffer"
> instead of "vdev0buffer" ([1] and [2]).
> 
> Add optional memory-region-names property to define such ABI. To keep
> back compactiblity, use "optional".
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Prevous version
> https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/
> 
> ---
> Changes in v9:
> - s/hidden/implicit/g, sorry, missed at v8
> - Link to v8: https://patch.msgid.link/20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com
> 
> Changes in v8:
> - remove dev_warning
> - remove dts patches
> - Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com
> 
> Changes in v7:
> - move imx_rproc_rmem_to_resource() close to caller
> - collect Francesco and peng fan's review tag
> - Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com
> 
> Changes in v6:
> - collect rob's review-by tags for binding
> - move imx_rproc_rmem_to_resource to c file
> - dts move related memory region node into overlay file
> - Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com
> 
> Changes in v5:
> - fix binding region-memory-names's pattern
> - add vdev1vring0 and vdev1vring1 at dts
> - collect pan peng's review by tags
> - Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com
> 
> Change in v3
> - rephrase commit message and cover letter to correct descritpion and
> reasons.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> ---
> Laurentiu Mihalcea (2):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid implicit ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid implicit ABI
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++++++
>  drivers/remoteproc/imx_rproc.c                     | 29 ++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
> 
> Best regards,
> --  
> Frank Li <Frank.Li@nxp.com>
> 

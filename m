Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190637;
	b=TIeNYh2CwbJoq7qdCU6ziQ5brehcbiovq2LwjYHY+GKcE/hIyvZwveyUIRDasXxkHmiB
	 Kjop1UTwYHaUlRChA8wyfaBp6RKd3+PARvoqUun46p81N5LudxKaPhJ0O9G2I7+pP43YS
	 dY6w3QdDBjexNr6fxhrAOw48Inh2Dtna116GYqJQBeNzvkU0meqDq5kl3UftXGJ2eWTjI
	 aSXMy92+EulbCYmER7N5VtEtsW7ZJlfK9c3WTFUZEDff7eUo/oAgztmwoW/iKzRnRBAPs
	 tXMRdVlY8M5U4gtTUqVAp/VeNPL3uZ99A3cpwmDVQyCRQqBQd4GL4k4i3K4KVn+ottA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
	b=wYnIQvf5uMtWC77RcGUhddSDATRPFtWt6EVgl9Tvyp1NefRwOsrBBzo0OwF6aYI3T/PM
	 bqdOcqXcmvWsu3gsF8wtdNJtPhEnkmN5FyC2Itj7Blh1LtYnARHaWE3quHUmz7Q/9d/f+
	 VpWFvHcPID/OpNSzeVGrMJQOZSBA/giWoUJZqyzJoV3ywkCfFCVcpluaLn5uPWav/bGqW
	 uic1o1/trKeeed1DaexvnFLWhrUlYd5qqFDjRGz6F21XNZp7lo40zN+tSmstsoqPZEMXS
	 +ZSCvorVBOb5lHeKk7uEw5snJtEUsVro+GNqoOXZNEpOjRSnVaHwljyoKYf3fhD6pjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Or56MwGe;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57408606A32A
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 16:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57408606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Or56MwGe
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc147d86bebso610719a12.0
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 08:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795190637; x=1795795437; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
        b=Or56MwGe/ZahyJLJ0Yg9WP8uh3aTk6ejBoHJMeqVEbVoyeCAhQ0wm3AqJFJBmWWWS4
         PSHHr9ngYCanX/uOF5sytYc1EbDOstzyYf4uRza+eD/91qe9qqF74G2IZ6Q3C0/zfkJf
         wn/0D1eJLeQ0ryXl5KDsOvWCh5Z/E8NuE/gFkCCxjZLh6i83l+rCFnmq9WAHRb7JUYUS
         SYzQtQSt9rBpqLLyeAX87te1T+DSNARivHz1u7/jktdG9kq7tEoo06leTR6T9GnTE15g
         gvUfMRYXtNzPJ7bNJt1I7f0rzXnXeHfKZzp2n/2ybAaZfMQxjthHVEtWJi+BTo4Ot8wc
         FwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190637; x=1795795437;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5WBI7zMXuMnXBAp0+kspmc9rCdvfQl+JVyaQXvmBGfo=;
        b=IAQPBMKljIfPKJh8+tULp8mFujMy52ROAKcARwgJI/IE6kl8W7+cToRfpHaZZS7vqL
         pfOdrkRwTsi17GY6GwE98SUs7ZDvlWwTwGQ2F+t1EzmS8h8DOeFT8vAuHsZf42YkYQjy
         +20Dsm2AATANb/Rd3bGi692523nX6p79vSZY3auzdXNE/Ep9B2gG+vlHrkiYY9oecU6B
         YvXSeDzuwYPKUG8+Yj/Img+OoaltycYqAV7fD6A+xwXDinvO6awsN5cnCP6HzgmYovcc
         SfRG+IsGDd40LWsoKT2uw1pqskiYgGIAKgnlv9U28hggpp/WCvK8y1l5nciE43wThrhH
         lO7Q==
X-Forwarded-Encrypted: i=1; AL+hErH5ZhOockMp1XzQEknTufMuzkwHcO/Pk+6GYGAVO1DqYxxo74RA74C/v8QK5RMOQoIqk5s=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Y226LL3Ih535Um5YDshmqE0h7oXur8Y+iIkWxmq30CtuQ5tp4
	sox/ITKse9klDPfavrcA8GjVSd4zbGIZ59NThJJhMGl7YY+ypJQ4Gj2ndyj1udbw/hA=
X-Gm-Gg: AZFdTZdMJjDulWQZN5P9rVlhUHZAFzYbLCZ9v2tPATD8DZtGNNuXI9V8ne6Uuuea4Bz
	H3zYEzYiRt06LWhP5j5+QNrYEWEoW/No2LY25maQsYGELG6JA4ssOSUifwkNJp5fxVgw/EuQYPo
	+RW66873UB7hfKDGvzXicONshkP9jMjcMJ9hn0l3tAOG/k5fZSeKyDNQamd5ICOVafSqB4H695U
	hUJZohKpmqI28sTGrYm16z9PnPlgfpoPjpCvXF4I1dKjEQH3VqurK/bQO07es1Cmrkz6JR8+jKv
	J1VtsMGyxYAugLi2BqchxbHtKiYtKhC3MYVSEXLQ/hWn4IzCUGZjOkQ4YSOa5FBYl5HaYVaN/TF
	fPVCljbyH6GqX+KYQK+skOiapJadlLkQ9bgDYV4tmXwOxqx0ujdBJgStuwJYKyYajjt6DpAy8oG
	tmFu+wXxhfNZrbzskJtXeF2kTpcydvxtvcAA14hDji15EA7KEKH829WvGxIAf3AC3c5Smx3yYta
	4Mg5e5ULIfgPWT4s9HlzdkEEK56YI1dYXKmx47OT5SgBkW/5QJH9SRuDrtaQrWFvKF+e4aS2zAn
	NduURpJdBfbxUQvX2HFzvR1KtIT9Yy1r
X-Received: by 2002:a17:90b:2cce:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b41c95e0ecmr2249223a91.33.1795190636291;
        Fri, 20 Nov 2026 08:03:56 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7124:798f:1b98:bea5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm4809307a91.15.2026.11.20.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:03:55 -0800 (PST)
Date: Fri, 20 Nov 2026 10:03:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/5] Enable DSP device for i.MX8ULP
Message-ID: <awBvaca7Az__X5Te@p14s>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>

On Wed, Nov 11, 2026 at 11:18:03AM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The debug reset control is one of the HIFI4 DSP’s reset mechanisms used
> by the debug interface; add documentation for the optional debug reset
> controls and update the driver to use both the soft reset and debug reset
> controller APIs (the soft reset is already documented).
> 
> Add a HiFi4 DSP node and enable the DSP on i.MX8ULP.
> 
> Changes in v3
> - Split the previous patch 1/4 into two patches
> - Update the commit message to explain why the reset properties are
>   required for i.MX8ULP
> - Update the commit message of patch 3/5 to clarify the switch from
>   direct register access to the reset controller API
> 
> Changes in v2:
> - Update commit messages for all patches
> - Require the reset properties for the i.MX8ULP HiFi4 DSP in patch 1/4,
>   as suggested by Sashiko
> - Use sim_lpav as the clock provider for the ipg, ocram, and core clocks in
>   patch 3/4, as suggested by Sashiko
> - Rename the reserved-memory node from dsp_reserved to memory in patch 4/4,
>   as suggested by Sashiko
> 
> Shengjiu Wang (5):
>   dt-bindings: dsp: fsl,dsp: document debug reset control
>   dt-bindings: dsp: fsl,dsp: require resets for i.MX8ULP
>   remoteproc: imx_dsp_rproc: use reset controller for i.MX8ULP
>   arm64: dts: imx8ulp: add HiFi4 DSP node
>   arm64: dts: imx8ulp-evk: Enable HiFi4 DSP
>

I have applied the first 3 patches of this set.  The remaining two will have to
be picked-up by Frank or Sascha.

Thanks,
Mathieu
 
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |  4 +
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 34 +++++++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 23 ++++++
>  drivers/remoteproc/imx_dsp_rproc.c            | 76 +++++--------------
>  4 files changed, 82 insertions(+), 55 deletions(-)
> 
> -- 
> 2.34.1
> 

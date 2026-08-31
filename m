Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77FE4A091A
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199419; cv=none; b=M42dyzgR5wXF2iTHcGyw5E5KAYNRk+kqtlxvJT2AugbZvUJQAVOhSbmiOvU3EUi9ms9Spm4/fI7BRKcY395pKF5dvAF+CxoeBnhDb5h0HpaqMy5QU3qMvh0mvqmTG/SasGC9v/TpUMnsCU535BRLGJaZE5g2tit95LzF18rsTU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199419; c=relaxed/simple;
	bh=rmq4A/3b9cJXS2TkfGSiciCNONWN4osSAMXLb20UGCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZ4e7gBOX4sC/ExhVAMGPGJCdlM90vcLhbG/li+bsqK9Yysr4ApCOp6Au2VZaTLkPIR0+Pv6I4WOqFAMIJ9luio5JbBZ612bWEFy47FZO/4qyx8I0ThR0/1f4CmM620DMDKba6iqPhoh+0J4kJIbes9I88UvPOtLWY7XHUF6Kfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEQK734g; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEQK734g"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d53197d8b5so31853765ad.3
        for <imx@lists.linux.dev>; Mon, 31 Aug 2026 11:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199417; x=1788804217; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scaTwoDAiAwCNDZtWleBwQ6YcnYnb/xcb5L8AHzEikQ=;
        b=EEQK734gfDA+kQLCrjlcnpRoqWkPC4XevfkLtfJdqfBPsMyhM1PCOAkdrwk+nJXsTL
         4F1+aalnIvjtKbCN3xVb7lT2b1r6Z+HLUIhZvL5ym6Tn3qm3f+9YNL5fPwes3daGDX1P
         L2a+LyH0VDKOZ1ZLRPtjabBO+xZEEoZsIZLtZUWvAkZqsoz0jICTrPjc63X6pbGN4q88
         cacrmhtnj6R7BPM7BMxSj5Fd/4e6R3J/e38E8lwK/q4GZDY1+OjjQ5+ZQhlX1mn4CSx6
         2pI+YMLsIYNFmTWb1166eJ4qqsgRYkv3qdaIeM/8wQeE7gHTO7Q7cDdstfiGwkN2Q2ik
         mBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199417; x=1788804217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scaTwoDAiAwCNDZtWleBwQ6YcnYnb/xcb5L8AHzEikQ=;
        b=O5L0f7eyXO1eyLxujz7lN4S7EnKWDe7u7oE8MXWqcKprSbkht3MPDEI/bwaIykr+OO
         HuZlFfZoDXjAWtZeFgMRAOWtbcoMP4ls/GLMe/NY5vJn1EBoquAU+3w9dqlH2xjo4fKB
         htjKC5+VNRsXD+1iBSn5QgXUqBSdrFsLAxqKUb78wpaj1q09OY+d3pP+IGORAsXV+2k1
         6tqECujoime0kG1ViIsanYfuqFbvgP/hcmvrIPOvHi/P7gAftnHK2yii9sX+0V3gXnNX
         ber+MPUgDxN2sx+147DdswvlBENb3TM6psONToThrqyuzlc5n7IdJZtRjXU2cNv5vdOI
         zXDg==
X-Forwarded-Encrypted: i=1; AKwUvBxNRE4d8e2zn6tMHKOQW7K3+1NVZYqCclPWfDoJPiVo6HSUeA8OF0DoTsR/pF+Nerqic88=@lists.linux.dev
X-Gm-Message-State: AFuF++lbdXALkCamlsixiZk8cu15Shek2CALGfmTAao+ieccZU6bdM2k
	EUz1wXL/u9qNmXHXLO2wl8vdxPW3XMhyaNEyy/v403n1RDzzaGrMMI7v
X-Gm-Gg: AYBFou3ty47DfgQWyhsTlSEa8S2zYy6cFpyDTdIown+Qe6LbRDH4FrF6JQT2TNKQwmU
	klqaBMKexgRhfp0NyG/fHeeOwkGPu1wAb/NDHJlER4LgwKTOovmNpSvS42F8zRgiCguCKs76hNr
	R3F03Jqx0834T75S/+bM42LmA1VC2cIr/8nEWMKVeWZsHyViHiL0eevfXIfGe4t+MFYja+H3gZd
	WLAv5tt3Q8F1RjHdYXNekPu191iNLE3An5saayBNORwrEHlj+0DxbYtxA0Bhu1RueLcoOwpexBT
	bAT1iP7fXcxo7BAf9f06UA/A9p7xA4bADSNnfflBYFB8sw20Yz8bO66K9Z+rkiG+VXMQw0xXv87
	s8HPP2zy09P2EqB+/JCrpww/m/++MZng5skzzrpbPE1iTfw3Cez02ecKvZu8Bgql/C8Im7ad329
	vBG0v4jqoRugWziVnaRTI1e5udZLRzCVwDsax3vvAXzO8ecio/TJWCzlvLMZA4EKF8EElPiYnPm
	g==
X-Received: by 2002:a17:902:ce8e:b0:2d7:107c:917b with SMTP id d9443c01a7336-2d94a32e0c0mr28121435ad.0.1788199417098;
        Mon, 31 Aug 2026 11:03:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be607sm31904707eec.10.2026.08.31.11.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:03:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 31 Aug 2026 11:03:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Cosmo Chou <chou.cosmo@gmail.com>, Colin Huang <u8813345@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 out of
 trivial-devices.yaml
Message-ID: <25786645-f9c3-4fa7-b1a1-11b3704c3806@roeck-us.net>
References: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>

On Wed, Aug 26, 2026 at 05:14:19PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Move ti,tmp103 binding from trivial-devices.yaml to ti,tmp102.yaml. Both
> devices are single temperature sensors and update "#thermal-sensor-cells"
> property to accept values 0 and 1 (passing no argument is equivalent to
> passing 0 as the first argument)
> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dtb: temperature-sensor@70 (ti,tmp103): '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

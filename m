Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640742;
	b=iXuGwcLE2K/89DfVBjF0eRL520tRTaLIfPHIJa+KN2ONRXNeivzl5RK6H1AhyCqhKl5q
	 XhlEkNCAxNrUgYCTueWRpMJ+6T7Bxku9WSE0vUfJOdms/eAkpDWHV6eJR81a4rIXa8Yns
	 3En2NiEt0Kvr8JBgA4gGSMZ0PKWJLnB67o+dc4J7Xv9qkkhLugNE74xIAAHJPcWLpGDC5
	 pfmMRilPBoyL4tDVlM1hmqhTpgQe1jghSePLF3dL7FXcPfyFsEIRnnqij4q7//AlyC1OA
	 3UcvFtUMvaetbRB+d60BtUIE3RhTSoWuRrWwTRulv8ldrdMibbJYjNwW179/RGrELEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
	b=CVyHyLPmDvs8MWghpzk3Gh7RVZzY+dK71gSRPoppypSGO/gNgucyRNEVh4lOgz/7EV2x
	 y1XAeE75JiemlPZKymwJhurVYtLHwf4Yg1ETuGYaey1VjeH8RUJQdSvFKKf0J9fSjfQcl
	 nTM0squuomGoXUe1Z6S6ekOEHHbXHmhqVA8BiQk2DYGew5lo6cWXTfZQLmh6slridbAAe
	 0EClhFm3wPHb7I0qIgIa9iuvcm9zJlOVInoTE2oBf0tUpZgOJ51LT//EaILR98awF+Sax
	 hrB4b5TkqVezekGi3aAlxMZZWAKQUxkE5FFMsIeq7FiFAXN1ZVtAuTqNs9bi4m4qWzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfETbmFM;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275F7606A5B7
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 17:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 275F7606A5B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfETbmFM
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso2306839f8f.0
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640740; x=1794245540; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
        b=AfETbmFMCiXzJSEYhjpc/dfrJ7Kqytrb5xVCqbNb7jcLjAfpeSxAMviD2qPovZhsaJ
         8zxTp570mYH2Y2RR/zAbqdZ+0NCLRS3XAEw63d1Konvr3Mmy8D8w9fo4t4MAElxk++AN
         m84v57TJGjNx9wASFpMXDABB8BHA4M8G11EpmA2lOz4v+O/mhKDJUB6s0Y1PhyJMYnmz
         cbJCupZ47/Mq5fgfb4+nBkmv7MnjhnTKHanCiwx1+FB0EAp1UpviPirYSpzmWf6IpvoJ
         EgAxIbTUbONQzMWtTi4Y1ig1+c62UF/k5HITE+qAhGlyNowyrTk+T7pmcQJmZyDmnY1X
         GCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640740; x=1794245540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
        b=09XKiGsYV1siJCgmTvCerKYe7baG2crP9jK4KdMlLltD/v4RzWS7FgmjrPUv95P9Bu
         8kSSRmacWCTLLH/TLbbsS6xIBbebEXl33Di20dJHwUxrpcFDvcTSb587a0cgn8eSU6j5
         iQbZsHRW425RAl6NaKunPu2AXfI7K1n+foheyvZtxQYUPFJ5bFIh2TnLS1jIhmFOGm5+
         1MA7KjbrP4Y3dfo8L0OhLrrfEogAOF7Fi4Im6gJF1USxmnwh/IKCczTj3eqH1+zAmehA
         7o9sHwiqYWxkkdmH/O9tfXZMYQURN1wZVsTQ5xfK1RwWa5a3wa038SDPWbLievJiFF92
         eKHA==
X-Forwarded-Encrypted: i=1; AKwUvBwbU7u0iL80aJbUTIjsYwf7U7OcjVwSmeWC33Z7umzHIvU5GA5TF4yMYe5CRtXjR3WjcIc=@lists.linux.dev
X-Gm-Message-State: AFq9FYI675IRgtBu6BHvAeMvbqUa9eQ98K7ZzzSHIBLF9d75NGw3Gsru
	n/NqBkMIw0gbZwgOyxS9jdP+AeZcgf4OwkuN6q7lEwtgki84yA2SJtFl
X-Gm-Gg: AYBFou15YjJ18VlEjf9wDn7lIlf2J5ydWxOc+AwF2LZt0JoGHTU0u4hWm1u3gRCoPXb
	C6vNWThUckTIX7Le9dKBoOqlPJoeZ/aDVUCoYH+fSy39tIHjWG1loyEFVT80oAwKYUF/uQtBIVx
	rf/wDe+J/E7FWjxLB1RWdyq350TnijguPP5+VjvfPltMWKPBpSOlmxKs/yIC2AD9Zn8ftcsrbiM
	9+Grr+MyyGstAdddeBv3Ho1umd30MD/nsUVyhDfcb0XJtWR2LaQYGoORQkKzZG1LYLE2OUx7hfw
	/xNO+8MnY/bwTKKFtHX1ZHzKdS3xnSwMo171YSRcUc0XRbc6Pw34bZgdH2rGEh9XbDykxIUuzQE
	T24lpQ+AAvjBtSS7ElovJPqU87xVrOuqoBFIAX4L01hvIaIb7hZ3robepkPcDuUGK1Fuyrl83Af
	IUOQLZfkjglHuUGi3PG2kes2YPUwEZyJTmnfZTT/pL5XHTVKi6LZ8e8Ymq1SLeLZ/i5NSo2C7km
	oasmN1nbrU2rWplRUtwXtJsvETAkHP9uPBmYkRwVt25ik36iUsvtEJJm5LyUjvjNf80bdyI5OPZ
	wV8sl+3TE/v2hEvnq1Ifu01h1I2WK6QKer/3jRx+C0ZFiApf+1Y54dlsW8rLbrZR/PsazXP1eh7
	n16p85iSGXX0pO6ETCRg5
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4ac182dc0a1mr263780855e9.16.1793640740359;
        Mon, 02 Nov 2026 09:32:20 -0800 (PST)
Received: from [10.0.1.67] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm2039345e9.15.2026.11.02.09.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:32:19 -0800 (PST)
Message-ID: <8abc611c-525e-4450-b924-87dcad57a578@gmail.com>
Date: Mon, 2 Nov 2026 18:32:18 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank Li <Frank.li@oss.nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
 Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
 <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
 <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com> <auTPTxt5ioBJrr27@SMW015318>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <auTPTxt5ioBJrr27@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/30/26 18:09, Frank Li wrote:
> On Thu, Oct 29, 2026 at 07:55:41AM +0100, Emanuele Ghidoli wrote:
>>
>>
>> On 10/28/26 22:05, Frank Li wrote:
>>> Does it only impact superspeed? High speed work?
>>
>> No, it's not even enumerated, on the Dev board.
>>
>>>
>>> Thank you report this problem. Suppose below patch should fix this problem.
>>>
>>> I have not time to test it today.
>>>
>>>
>>> Frank
>>
>> Tested, it doesn't help.
>>
>> xhci-hcd.1.auto has no fwnode, so platform_dma_configure() never calls
>> of_dma_configure() and the new code in of_iommu_configure() is never
>> reached.
> 
> Finially, it is hack at uboot.
> 
> 592: static int config_smmu_fdt_device_sid(void *blob, int device_offset, int sid)
> 601:     prop = fdt_getprop(blob, device_offset, "fsl,sc_rsrc_id", &proplen);
> 618:     ret = fdtdec_parse_phandle_with_args(blob, device_offset,
> 620:                                          "power-domains", ...
> 578:     err = sc_rm_set_master_sid(-1, rsrc, sid);
> 681:     prop = fdt_getprop(blob, offset, "iommus", &proplen);
> 848:     if (is_imx8qm()) { ret = config_smmu_fdt(blob);
> 
> 
> Need combine power-domains with iommus.
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> index 176e2e332f87c..cc2b9a212780f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> @@ -189,6 +189,7 @@ usbotg3_cdns3: usb@5b120000 {
>                         phys = <&usb3_phy>;
>                         phy-names = "cdns3,usb3-phy";
>                         cdns,on-chip-buff-size = /bits/ 16 <18>;
> +                       power-domains = <&pd IMX_SC_R_USB_2>;
>                         status = "disabled";
>                 };
>         };
> 
> Frank
> 
>>
>> Emanuele

Hi Frank,

this works. xHCI comes up fine and SuperSpeed devices enumerate again, with no
Host System Error and no SMMU faults. Tested on Apalis iMX8QM and iMX8QP on
Ixora carrier board.

A comment: imx8-ss-conn.dtsi is also included by i.MX8QXP and i.MX8DXL, which
have no SMMU. I get if we should put the property in imx8qm-ss-conn.dtsi, next
to the iommus property it goes with.

Thanks,
Emanuele


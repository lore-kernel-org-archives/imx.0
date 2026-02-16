Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D0B325730
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255337; cv=none; b=YZ9Vo3rZuv09kHwfwsZuQrYCxaddp2fR6jEIIJe8dfypHAZ+LJYY17tsR10yyZnhi8FtgD9m25mbj2/Ggqp2x/xR3cCu4ZI6N8hYV2DaMUmy53mWam8RH1XM9XYqwHfdd3r+M0bLghT2VGeTjYHarcZ85fWLM/OVTb9ghebh4nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255337; c=relaxed/simple;
	bh=rO5pvMpoFmL8Fx9NoSnLv4h+94kVFJV6QpMLCSMKBYY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Vaw3tKJpzu28WHRhbErQp0vJCbqBq9zwhbk4bZNC593aw3KwuzDJ8TrlyDBDLx8TDsgh4Cm0HrcESyKnzYi91x+PuiED8SuT7NH5yrL2fYASZQ/gUi0ZqHJNmw/mwaaTzeBgwknyZ3tO5tAI8XUeqvYtiPxiQg1dj9qICSIbB6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VGp0ddLi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VGp0ddLi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771255334;
	bh=rO5pvMpoFmL8Fx9NoSnLv4h+94kVFJV6QpMLCSMKBYY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=VGp0ddLiK3M75iH7slbP42Pf/2drvgeo7I2GaYWx/+Myyou9z+e7TCwWnvR7CzAGf
	 EY51OJSso1SO642glioZJgYN+GTdR4PtW+OvdpHVPJecniKapCxvtZRDSYbS/RJLLU
	 WZmPL0Wx37NdMhvuN0EU17NMgPGG0DypPlvmZtQSP3FI6q4EUVvjwfinuOvE3MLpSV
	 5eLPr6my7g1iyVfEeuTmtgH+9hVOOFGLQREN+6S21DwbVGbjKQZ0R5B9J3FGZB67yM
	 S76+lNXDz2EGmNuGCdt1yWO1C7zFamE414YxxtoMy0ySguT8eQjunWNWALdtQCCdHh
	 MVfgifyFu4OYQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DADEB17E01E7;
	Mon, 16 Feb 2026 16:22:13 +0100 (CET)
Message-ID: <e06feb9d-47cd-40e6-8c43-b24ff8a3e800@collabora.com>
Date: Mon, 16 Feb 2026 16:22:13 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: dt-bindings: add NXP i.MX93 compatible
 string
From: Michael Riesch <michael.riesch@collabora.com>
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
 <20260213-imx93-dw-csi2-v2-5-8be6039f44c6@nxp.com>
 <50a82e17-1666-4ef6-ab6e-c0be3c780a0d@collabora.com>
Content-Language: en-US
In-Reply-To: <50a82e17-1666-4ef6-ab6e-c0be3c780a0d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Frank,

On 2/16/26 09:31, Michael Riesch wrote:
> Hi Frank,
> 
> On 2/13/26 21:25, Frank Li wrote:
>> The i.MX93 uses the DW CSI-2 RX controller, which is similar to the
>> Rockchip RK3568 implementation.
>>
>> The i.MX93 variant provides one IRQ, two clocks, and no resets. Add the
>> "fsl,imx93-mipi-csi2" compatible string and keep the same constraints for
>> rk3568.
> 
> RK3568.
> 
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> With that cosmetic fix,
> 
> Acked-by: Michael Riesch <michael.riesch@collabora.com>

I just recalled a conversation with Heiko we had off-list a while ago,
and back then we kind of decided against a snps binding document and
compatible, since the integration in the respective SoC (family) varies.
Thus, we went for a Rockchip document (which shall be extended with the
RK3588 variant of this block, for example) and thought that any other
variant (e.g., the one of the imx93) could be documented in a separate
document fsl,somethingsomething.

Seeing that interrupts, clocks, and resets are different, I would
recommend that you add a new fsl,... document.

What do you think?

Best regards,
Michael


> 
> Best regards,
> Michael
> 
> 
>> ---
>>  .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 47 +++++++++++++++++++++-
>>  1 file changed, 45 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>> index 2c2bd87582eb8bfdd13720edd62a5f00dda958ba..4ac4a3b6f406408b9524c795e6cdeb117d3353da 100644
>> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
>> @@ -17,6 +17,7 @@ description:
>>  properties:
>>    compatible:
>>      enum:
>> +      - fsl,imx93-mipi-csi2
>>        - rockchip,rk3568-mipi-csi2
>>  
>>    reg:
>> @@ -26,14 +27,23 @@ properties:
>>      items:
>>        - description: Interrupt that signals changes in CSI2HOST_ERR1.
>>        - description: Interrupt that signals changes in CSI2HOST_ERR2.
>> +    minItems: 1
>>  
>>    interrupt-names:
>>      items:
>>        - const: err1
>>        - const: err2
>> +    minItems: 1
>>  
>>    clocks:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: per
>> +      - const: pixel
>> +    minItems: 1
>>  
>>    phys:
>>      maxItems: 1
>> @@ -88,10 +98,43 @@ required:
>>    - phys
>>    - ports
>>    - power-domains
>> -  - resets
>>  
>>  additionalProperties: false
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: rockchip,rk3568-mipi-csi2
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          minItems: 2
>> +        interrupt-names:
>> +          minItems: 2
>> +        clocks:
>> +          maxItems: 1
>> +        clock-names:
>> +          maxItems: 1
>> +      required:
>> +        - resets
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: fsl,imx93-mipi-csi2
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          maxItems: 1
>> +        interrupt-names: false
>> +        clocks:
>> +          minItems: 2
>> +        clock-names:
>> +          minItems: 2
>> +
>>  examples:
>>    - |
>>      #include <dt-bindings/clock/rk3568-cru.h>
>>
> 


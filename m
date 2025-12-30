Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EF032ED40
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767120137; cv=none; b=I078/RL+bLZxoo7YFDIyxFXboRDFXZnCHZr/saC2hzH/emwW8+O0cqLw/hghVUVHPTE2mIgt4ZQEHo9TnwlUGoxvaREE0iNfTV2w9bQWTELPk+7aQoZ36cWcPFztqeWMf6DiFb2munYU1EFBfOox+FlAuq+0MMERB4QmBc4/vT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767120137; c=relaxed/simple;
	bh=6DyDQ0aMfsmiMUPXAs+udMoSEHmchdLDSRfvPuWrk2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEkysKCTPiLc8j5Fs+Pc+7tB02K4xic6FCHalmfr2kkXn/kuKWdPDm5G7ql4yRvUJ8uvVYwKOsE9FT22TvkhBVtxQY/kQyQd8HTvfTb9JGXeHB0w8swDXGgFdESQNPbCNcpQahR4/6hbiaw/JU/mJaqbbH/fNltIAgawsqOAxrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Z+qGxRmS; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Z+qGxRmS"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A66710CD1A;
	Tue, 30 Dec 2025 19:42:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767120132;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1PSqBtSI2uQHZrjYZKEdLj4wI/WA6L2dT7HhzbgmG2Y=;
	b=Z+qGxRmStmSHESEHo4MAwIl6A1vRGa6foAmnDQu9S/PiUo+DpAMWrsZzs4VDHYtHCQ+NRM
	Rey7SEyohW1dloibJJccvYOSgTo/uCrsZ/1EGCLkhGnqUvvRBW2YgZJaKtHMGcIsAg4nRR
	X0coqHHYJjLdR/3vIRQiatnjdpWq8PYG9Dmb8fNf89pkVseCmaAUAD3+AIbYwIwFniU1Sr
	N16lZSxpcLNPCs26VJKqtRvHTDP65xaX0V2tYOIT93V7btNXGZ590cjmaMM6jslgL31PJL
	/BElVExzjyvJBHRdpsOJdBg6T35GrMCAyqee6eh/u+frIRwDjrNpGmzrRVlirA==
Message-ID: <be90bafc-7900-4d73-8fd5-39cf855a0bbe@nabladev.com>
Date: Tue, 30 Dec 2025 19:42:09 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and
 v2
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
 Christian Eggers <ceggers@arri.de>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Markus Heidelberg <m.heidelberg@cab.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251229193706.73564-1-marex@nabladev.com>
 <20251229193706.73564-4-marex@nabladev.com>
 <e3d305ce-cdfa-4a11-bd54-9648b12a013f@lunn.ch>
 <dc29e774-07fb-4d0e-a88a-27d4ec49d060@nabladev.com>
 <51825dee-c2c9-4d94-b741-ffdc2fbfa773@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <51825dee-c2c9-4d94-b741-ffdc2fbfa773@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/30/25 4:35 PM, Andrew Lunn wrote:
> On Tue, Dec 30, 2025 at 02:34:14PM +0100, Marek Vasut wrote:
>> On 12/30/25 11:46 AM, Andrew Lunn wrote:
>>>> +&fec1 {
>>>> +	fsl,magic-packet;
>>>
>>> Upps, i probably cut out too much context. This FEC is connected to the Ethernet switch.
>>>
>>> WoL for a port connected to a switch? Have you tested this? Normally
>>> you would have WoL on each port of the switch, and not on the conduit
>>> interface.
>>>
>>>> +&fec1 {
>>>> +	fsl,magic-packet;
>>>
>>> Have you tested WoL?
>>>
>>>> +&fec1 {
>>>> +	fsl,magic-packet;
>>>
>>> WoL again?
>> I don't think WOL is used on this device at all. Would you suggest removing
>> the fsl,magic-packet properties ?
> 
> Yes.
Fixed in V3, thanks.

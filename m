Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473781DA63D
	for <imx@lists.linux.dev>; Thu, 22 May 2025 18:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940245; cv=none; b=XaFFjXzib2Hf98aj0aXNfT0pLb3dI7t9dxo2XdjyhL8bTwcsR1SJab00zNTpKsWpvZlqme+/YMbTXObv6sKyU1UbxZfryEJOPo0WtvhxdPaqT/i7YRjFr22WygfTXJfb//mkhjCqL5kmwaMA9GYplYppiIx+BYO1xND/VQ7UWuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940245; c=relaxed/simple;
	bh=nRdyDoXu64jIJ8Y7YBIH/yF7ZXDgNxt/Zb8gayh7VQU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cdGtKcSfTABWLrGKRmeCKPzCLvUpsNZxYx22CBVvXkQ0uKIFOUNLJoBSBxQ6iZozv2b2AlfRmrPxGbYLkSLr1rvObATd4NOo25c0p4KP9xO1KdLPsGFWVRjSfeNyHWzhGl/O+e8f2JLCZcTC9Np2UypArDquA0T5mf5ZuHY7fcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=OqgNqDOY; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="OqgNqDOY"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7caea4bc9e9so1338958685a.1
        for <imx@lists.linux.dev>; Thu, 22 May 2025 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747940243; x=1748545043; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bKDF0rG/fer+2OkTia/V0rbvp3EJG9E9bbf9h1+yVQU=;
        b=OqgNqDOY9dMfbPQcHKcxdvpa/Gd3I0XihITKcjGNXvpOZCpMBRrqm3XJVQw1gKsE3j
         eLDv3JnSp2D54NJCM1CVPSZ8PSuTYoyHHMevpJYYWSu8/aq8Hy26MIj/PbbErwMOg5Wx
         +zLsZy4oo1IwUlyZxhPwoRSQ0MLWntVaJxbD2F4HmfCzd6U+8y494o72yEyfKnmuPYiD
         R1qAJSWQUMUfMfZ9eqUCg+fA/uyjsUERcYwbe3Z6lJ1J4hjkQwg4LCEzS6XvhkHjayiz
         XbiJ1i0OTxtMHeYjQnJ15Gz2hYEXjuOSHN9H20xPY3P5GaFP6+Zxi02FmK5GS39ywuZk
         iOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940243; x=1748545043;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bKDF0rG/fer+2OkTia/V0rbvp3EJG9E9bbf9h1+yVQU=;
        b=LcSnmVgI7CtdwhHGzDxhj60Fz5ZOPbx0p0nb7VE0VrByzDQ8se9TOzqBMXruqz9T10
         5l4SiUHXnz1ZPGzzyM+t0rpnvL5pRfh2YFp2NWoVGn7TGkyqUJXhLoetEO6i08o5XFBe
         71f1ObwrVQ0aH5cydrp3MhMRr588T60HKDnfin5DGnuoutKwnnWmijgQPQ14hDnuVkwj
         zf83a/RUUJXt/Kts52jd8c9gbfmBYAleMBVweXnVEjtvBRq0mQL3AwY0tYboLyQcpuKR
         IupZF09FFkBUKzi+ROnQ80Iq0ynksDcVGZJDNkEr2UGetFs9oxF7ldXNmXqgWVW5mO3H
         xhZg==
X-Forwarded-Encrypted: i=1; AJvYcCWvgVHq8FpQCUdcbNe6aMfOzjmWNahV0MQasJrUd5+qEdO2/BHH/XbnFwTNKlAQ/Cl8BGs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJtDNdp0hxW1NRwANMDoRYOCpZybdNNPtqE6tO9kZ6/pfq5r33
	7kjaEpaG6DnEbJPGOZAmSlsUMZFFW7+r+CZU1s3OB5P8KZYidYPfgL2Yky7laB/YkRs=
X-Gm-Gg: ASbGncuQRzPdjfeqexMgi7wybQJ+h3gd367mPMTMXwxXJlOwkhuKwg4spunDrwpAluX
	JKaMCw/JZfeLzYJAXL0FL2XVBsbKmQ8l/cUnnjELjsaYu7oFAOXjnjR12QnTaZZbNiBwWVxBRb4
	DdGHIbkz/614bXTcb4/hwVgfYwkMX/oIwO0ADQdGbPM0heC1yu1Wb7/Hrl29MHH6n3277ukRKss
	nanJQ8wYCVzT+ZmRD5Ix4/BgmVVFoe8ogRDhDY9TojRG/HlArmYsbTfv9yn//6W2WaYZDY6zh92
	3wdH+Dd1RqiFs/x5Xs+LVgpcBLHDNcXhZb6O05yDLLJCyAgRiXeDFMw9
X-Google-Smtp-Source: AGHT+IGODjylhCbxxluSCJxWwfw2LSUZOhOlLONS1CCWl3mGWECFOnr+7cX5kbAgDceujcx1nVam2g==
X-Received: by 2002:a05:620a:400c:b0:7c7:a524:9fe9 with SMTP id af79cd13be357-7cd47f4bbafmr3554668185a.27.1747940243241;
        Thu, 22 May 2025 11:57:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467ecf98sm1060304285a.61.2025.05.22.11.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:57:22 -0700 (PDT)
Message-ID: <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
Subject: Re: [PATCH 1/1] dt-bindings: media: convert fsl-vdoa.txt to yaml
 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo	 <shawnguo@kernel.org>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org
Date: Thu, 22 May 2025 14:57:22 -0400
In-Reply-To: <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
	 <174448105342.1415739.9619142538994119426.robh@kernel.org>
	 <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Frank,

Le jeudi 22 mai 2025 =C3=A0 14:49 -0400, Frank Li a =C3=A9crit=C2=A0:
> On Sat, Apr 12, 2025 at 01:04:14PM -0500, Rob Herring (Arm) wrote:
> >=20
> > On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> > > Convert fsl-vdoa.txt to yaml format.
> > >=20
> > > Additional changes:
> > > - Add irq.h and imx6qdl-clock.h in example.
> > >=20
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > =C2=A0.../bindings/media/fsl,imx6q-vdoa.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 42 +++++++++++++++++++
> > > =C2=A0.../devicetree/bindings/media/fsl-vdoa.txt=C2=A0=C2=A0=C2=A0 | =
21 ----------
> > > =C2=A02 files changed, 42 insertions(+), 21 deletions(-)
> > > =C2=A0create mode 100644 Documentation/devicetree/bindings/media/fsl,=
imx6q-vdoa.yaml
> > > =C2=A0delete mode 100644 Documentation/devicetree/bindings/media/fsl-=
vdoa.txt
> > >=20
> >=20
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>=20
> All:
> 	Anyone pick this patch?

Thanks for the highlight, this is stuff from before my time and I had not a=
ssociated it
with CODA initially. I've picked it now.

regards,
Nicolas

>=20
> Frank
> >=20

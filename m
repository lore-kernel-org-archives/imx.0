Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594254;
	b=inYryQCZiXEMmaMbtSIwtBVI2zLY4vxVd9A0tWcAe7s/9k/88tHxdrcXKm7w2fxtSyGP
	 MHN8ZwUu+aB1iwUveuqDmJi6y+Ye8GRVxJpHM1s0D9xNoWeO6sikgBZdM6Ct3KgJ1uwR0
	 FmkA20v6pVkDIFPfqgvfhzoYKiuV1yKJKwgJvx/w3vbqach5hJzSD/qTa6OwIVNhRq2tc
	 uvRPmjr9KmzJ5vtl65GZWzjuTK3rPLe7vfNCltPERTD0TKGhYkiFJ+x5wbdNqRsC5qapz
	 X8SygcdSVC0aQY8ppqKLmMtteElr7sJxTisJfvt267Ofc/izCsErgG0eivgUJn6mEJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YVCS8IMOn/kwNHYEAA1+rZv+hhTaZu2a0obFMQzn71w=;
	b=kLczxf3EjFVqd1sCnP141/ejAayl4g+JIVJlqE/qdlg6/EBT4FsJdTG9PKNGfR7ATix1
	 QWPc9AmBArSctvdkkV/KmFrLgwbqAUlC7RqBkebv2wYwN2WSmvIqPAQWsYrJHBt9XgJzo
	 ewDN5cUFxmVwRC+wAV2gNtpXit75jdExU+n31ABnEYDa/KcdVu6Ktuyb9VpOcd359xHRG
	 34w9PDfep7u3UDgQOaVsLmvymHmeqebb+P2EpbINrZxHS9dK4hQ9NqEgcJnJ5uZi0/H+8
	 hCtapdF3UWsBI8ODMx6ic+OP/ScvZnI6fLD+uaX0uLvuW5riu8iSIDi9g0VcYz8Zmiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cKc6bgGs;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080BD606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 080BD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cKc6bgGs
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso4710452f8f.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 00:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1795594250; x=1796199050; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVCS8IMOn/kwNHYEAA1+rZv+hhTaZu2a0obFMQzn71w=;
        b=cKc6bgGsuKqBWYp/+oQZRzmPwFeB7R3Gb1dMpNGy1NVHc2gnr2Uq5unMcte3jLmwIW
         f/VXVwY5C1UFlt6k87oWbK2sJO8+tJMlp7cafbp/c+XcKyt2v9I11AAiWCuITGkfAohr
         Wh6qMHdJzVvfjX4chNJL6eGtzrK7rA+A3KWTqRMm60RhPw7CJayM0yQMz3XKc0qE2hqt
         HbkXl2YdYMIwCpQ3Bp0edDIR1R+cZSJfUBA+YlB7M+PQP52Rof74KRHHrkSdpScZerU9
         /7D7xpIdD1492irGlWGOHq+VkEMlHUEkzs2TV5QjJOgGrdscnA3LzfVJ5pZ5f06Qy5jk
         Vbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594250; x=1796199050;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVCS8IMOn/kwNHYEAA1+rZv+hhTaZu2a0obFMQzn71w=;
        b=n1oEVq0+GHkCa6D+SC8vmdB+Np3sgJf6CCfkl/nDPH2UJepLf3vVEi4lh3Ge3gejUG
         tccnJbg4Fn9s8JPp1xmkjK16UB4zyLU14Vqy16vqHOfcC9rafKu1rNUjjnsiDYBAny0M
         cYbw3bVGx+WlBLu3sIiSPiQFOZICzf+9qVmTQSj9SHruPwgkNUeqE850X1o2mc+4CAkE
         UA+b/rq5UocWC/E+Y0iOVRZsuyFjkdItHj/Hk6+lhU2eicH4kFPGLRQ8kJSW2b5YBcB0
         YkasXA5t0Q6BG31BbF91Bn2nmZ4B2/o1CPTo1SVPq0pCVkgCMhgElCz1ELD0A9SZ0upX
         lHjQ==
X-Forwarded-Encrypted: i=1; AL+hErGp89143A0Ph12J+etISBkBcmyyW1J+H1i1ixY2ED3+e5dBMubIVR6mj5QdMnkL7ZKvEp8=@lists.linux.dev
X-Gm-Message-State: APuU4Z94vxR6gbxKddK5dWKJOOdjBExCcAlUKWjZsnqyGCPRO9fblCF2
	dbAY+5SG0UczYgErf7qO+vMNL1qutwBicHxqulEI8NrxpIF+nFKNcEThIjZEF9jBU5Q=
X-Gm-Gg: AZFdTZdJIEhPoN4TaxqfTt0shGg9qM0DeC0GCl9gDwEYeXKfr0IhlFd4/cOdSRAv6Ua
	6Yfv1ps5FLyzNLJnQ36hr2xRKs/Ir/M3w7yjZQe1U1hk4f9PqCKM9Z7CbP4BRXOwn5zP9+50gZS
	VzpoRFsMz6G2E6fEjGDixEUYXiu741q0ppyePMFOFH5EKl1I11wIi11VKp42NqDXulrqnZegGCw
	uDQVdgCdM+3qL+0V0sd8cGmHHn1qUBuTsZCP+4zPyLQJxE994OctQ1eKHElNFVwiAETJSffMucA
	NDv8zYjeCZ20lCp6gtQARvJXvN7xsRaKegSfi2J/Is5OBMNhe9h1KyY0aOUit6egI8Xz/rTmOFr
	SRQzae8N0kyI8sabtXD0ahSlIrqXcLPjJJnekKc6m1DgX6z+CPKhgUkRTcdkTrKYvqfzQesEFVb
	T0vxbtymyUf6buUqGb6GOwwx14WZxsU4VeJ2ouv6G52Uoq9YzQJXiLFNlYeIBkz1XwqDg9JVqZE
	/2g06nl31ugnSZbpJIkshvLDhOdqJCxGkf4A8Yty08X3SDUZnlEfh5dmq5BPsxDQtovVn+3muCl
	yVvr+Fesg8tV7qZ4IDYiVvkLOkiUIpLBlvs2TycvZJiA2ao/c8zF3+MQvtSOT9bifT8ZZyKfYhE
	=
X-Received: by 2002:a5d:5f93:0:b0:4a5:33ad:871a with SMTP id ffacd0b85a97d-4aba56f470cmr32677127f8f.0.1795594250026;
        Wed, 25 Nov 2026 00:10:50 -0800 (PST)
Received: from [192.168.2.69] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm31415134f8f.0.2026.11.25.00.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:10:49 -0800 (PST)
Message-ID: <f7fe449e-5dd9-4476-9f1a-100466dc0c8f@bytesatwork.ch>
Date: Wed, 25 Nov 2026 09:10:48 +0100
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
Subject: Re: [PATCH v3 3/5] arm64: dts: freescale: imx93: Add MIPI DSI
 controller node
To: Francesco Dolcini <francesco@dolcini.it>, Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Michael Walle
 <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexander Forsch <alexander.forsch@bytesatwork.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
 <20261111133119.1063210-4-frank.obergfell@bytesatwork.ch>
 <20261124201110.GA366860@francesco-nb>
Content-Language: en-US
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
In-Reply-To: <20261124201110.GA366860@francesco-nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Francesco,

Thanks for the feedback and the offer to review/test!

Frank Li actually just applied patch 3/5 (the i.MX93 MIPI DSI controller 
node) to his tree. The remaining patches (dt-bindings and board DTS) are 
currently waiting for the Youritech et050fw01-kt panel driver patch to 
be picked up on the DRM/panel side so we don't introduce broken 
dt-binding references.

Any additional Tested-by or Reviewed-by tags on the remaining patches 
(or the panel patch) would definitely be very welcome.

Best regards,
Frank

On 24/11/2026 21:11, Francesco Dolcini wrote:
> Hello Frank (both),
>
> On Wed, Nov 11, 2026 at 02:31:17PM +0100, Frank Obergfell wrote:
>> Add dsi node to the i.MX93 for support with mipi dsi panels.
>>
>> Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
> I am not sure if the other patches of the series are ready to be merged
> or not, but this seems a patch we should merge in any case so that we
> enable other users of the DSI interface of the imx93.
>
> What do you think? What's the plan for this series?
>
> (yes, I could test and review it to help, I know :-)
>
> Francesco
>

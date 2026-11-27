Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772419;
	b=aHnlggyR/1GEGU7Tpk+Yf7Tp4c1y6mO9oKWW4UXfcgY4gzLWRAtulp+kjLBCE7oFawvq
	 NfquCe4uWD5p9rX9gQAdht0+A2rzeDBuVJtH981J9/UrQO6fW0wACOK6gw2/aZF6s5/nu
	 4ZJbKaJoac1VDUWKC5t5m2FK3V9tDYcrkbIXZS+2UGGn8KM4T6nlfv93tWDzLGj50gDec
	 4HyCRuKj2EfRrGklDZufEYd9v5sh5dnvZztwMgtKGX3MJQyfiNn+knTGsD5i/b1r/nXYS
	 VEU+JP8ISX1v8W8g9OlrOxCw0oWxxdTGK6ZljdQwVPKdJ80Bv/v9xNXzGoERje/WtIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=j/S2sE6LJNqIp5xSQpYLBNCbXBU+Ch2UhYSZo3FN//s=;
	b=fF69yNnxsglG45R/xWK4i6w5mJkqTr4CDBCb2lyXhFZ0a8cwJ2C+VCKjeyBG3uDM5E8Z
	 uidY9HvXd7zrqjzHRtfSlHbzU3Um7Q3USXsbKLcQ9km6SC/7z4zaCTAsBK8WKf7vlk5ik
	 4BbnwuYL7ldxhrXuO37VeRQEltcow3kH7iiSYbBaNU2YbHmEswE0bEoEiWL5HGsCa1PL6
	 vuwyumu7MHccgyZ0OBl3GE8E9gEP+vKQ6SqdE1ZFh3xXdTeTFq3te5sRISpxixRcBpMvg
	 7gx0F0/PXpclgQ0B0Iq5QlaKCa4h8RvLD1Z0Ebef+IsCqZi7TYaECyckc7UETs8m80g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mechasystems.com;
	spf=pass smtp.mailfrom=mechasystems.com;
	dkim=pass header.d=mechasystems.com header.i=@mechasystems.com header.a=rsa-sha256 header.s=google header.b=FeafNa4a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD2E606A32C
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD2E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mechasystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mechasystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mechasystems.com header.i=@mechasystems.com header.a=rsa-sha256 header.s=google header.b=FeafNa4a
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b563e32936so3758668c88.1
        for <imx@lists.linux.dev>; Fri, 27 Nov 2026 01:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772418; cv=none;
        d=google.com; s=arc-20260327;
        b=aHOhz0scWbdtBS9XJJVBCYVM3fdRzAGIHkKq4iEeoE7HUw0i5S5nM1WRPxiRyiwt7P
         H5jHXPBV4pZoQ40X1b43ARfpFdVG7YHmYiAt9WRaftPl5vJjwcQMUH+//eB3Ph+pelj4
         32klcuOaTxhJj0NRH5FsnFk3xgvE6t7aZjMzSt8t8XUiRoeYuwi+qA0MOsqK8xdB3dVo
         AtrSh1h1Nb3TZjvSF7jumkmytfbtoa4YfC/wjxQE3s18eyvQ8xAapDPEkyQBZzGPlhpM
         7KtrLyOeA1MSBTGzN5qwiIwDt4HpKuaKyhsBeSIKMFUK520TnBEzh+z6KiiTnRULxSvU
         HVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j/S2sE6LJNqIp5xSQpYLBNCbXBU+Ch2UhYSZo3FN//s=;
        fh=KbTefpORwpQgj8AypHtIp/pn7n/50bPBvtv6Zx8vGXg=;
        b=j2NR+VupkYG8GXpOQDb5kvatq3tJD1pA3BnNtlViomzFm9SkeppMjbPfZiCPT1oi/T
         JRrUOUAbD0p6P4kFGjfNnI74G00pjOHIorTvjztGOFzzunzEkwXyJtB+UMOb8O2CIhvF
         x8+yW2EGgyCLqiDpw0plE5nRxGmiljeI7IkrmYBk9H9e4COJWHvvwP1szcBnVuy0wnqH
         qmeJMED4aoWRHv8blmX/lnFcK4C0lG9ArptlN9fRk38azID6rpDKIUXgstSZYl3Rg5u+
         +DVief2DgQ5xSeD/U855zDp9M9RQktxvMu+8PqwLJjohPN6jzgjeDv1FkRED5l29RGzB
         72Hw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mechasystems.com; s=google; t=1795772418; x=1796377218; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/S2sE6LJNqIp5xSQpYLBNCbXBU+Ch2UhYSZo3FN//s=;
        b=FeafNa4ad3olVr9BUhiiGRRkzLe9OKAJulc22CloewZyHFDzB6N12i16lsaxCopD4q
         xcjMJ+rHeBOb8xwp6BNna+PXCqqUAgJYpO0+uDkaDVfir7LMmSUUWubac6W4J7GMUZVK
         bC5mH8PCO0FOf0TqaRx9Mg+DFqO9HC7cA9HvTYKxmuHZxq0gyuVqGTEhft3VibQgG5T7
         IjmhKBpVkPwK2TjXi4Pg7rl4q1yRAoT6wPbhWNxyQjq9/dwA2upRFsE/Tl54tqRK3YBZ
         r66XROIxI8ZkCGOl2jG925ScZgMzc7zAPz5enC4fMRHv1ivNuG1pOu3Bufp00ijYSz3Y
         5/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772418; x=1796377218;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j/S2sE6LJNqIp5xSQpYLBNCbXBU+Ch2UhYSZo3FN//s=;
        b=STeNDt8KhGHT9i7yELw28wI35Q4oVcK9gJ37fzyE/HqjIi8PA8bJmp44p3xIW0NP1+
         iW+Oq1wuCQf0MRh5eUq+1hZ70i9zLI/yqT3HcPRtiA8R77xH4ECEe4LkdSpHgf0Rq/Rn
         3RVodMgumUJJY5hh+JBeRvgxIOAhmgdOMy7q27v00aXMOqAuf5g7i5cDB4BaS3Yu8Z8F
         Ui5zssTlYnilRrpwlMMHrfQBtryKOX7HPB3WWsrs+b3/73FZ7rlG5U0zKKwba1SFc6vU
         n4mKRL3carNsnYMIwtTF9tM/ulSMyiZRcBocqu5I3Eb7Cyn2X92peP3QS3pvaIBy16ze
         jynw==
X-Forwarded-Encrypted: i=1; AL+hErHnTgr86Ql0uMpSjq88ICPFi1tRyllG88k2+No9y/Vuiu+TCHTJBoinBeF1fK4BSRqIdW8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8q3tjP60m7Ht9DTuWm1+Ybn+uVtvx1233Vrnc3eUYWqIbBcljn
	/K2JRayViiZQ4hCFKg98/6TfEFd78g5c2jCXkTfp0O9gi8FvinKdqSzk9m+PQ2s7SNJncaFhK+5
	DhsUkeOm0mXxtbtJtDzjm7d/wbTCCOC1+pEp4UUieCQ==
X-Gm-Gg: AZFdTZfnNMORmzdMwcG3gzgpHWmG06H0ZF7HICfScaeO/qYWcVEoC0ebLh+LpkLQUiL
	oBAbBpG6iQVH1iw45zmhA2Emw3g3p/WPN+uQzKTz4XERwU2UMAW3xSda3VeSwwiRNRYHOrob1Jv
	C+er8eMcMrbb2+mV5IpfvlvrbyQSvuM65d815wvlFxt4uEMJJfCehr708OrI6c+G4wrnYOknhS7
	8Rc1XgEMnEiAS3AvMXu/pQs9D1bKbXfyb69WRnoWas90ovMZdobyhe5QNPQ7emLRNtuwwBBxrvn
	apsnGnYdzl1BEYl55RwJ1U3LO8pviQzRJgz75qxuxlcF3Z4QOnyKlR55TJxpi020AAViPN2l6/O
	JFNVG3vGBd/8LK/M2E94HLRrkohSpn28fO9Vz6V1xCap2w0leDvSp
X-Received: by 2002:a05:7022:1585:b0:15b:7f7a:730d with SMTP id
 a92af1059eb24-1b55690c5a4mr24437470c88.28.1795772417913; Fri, 27 Nov 2026
 01:40:17 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261126164058.2373605-4-ivitro@gmail.com>
In-Reply-To: <20261126164058.2373605-4-ivitro@gmail.com>
From: Advait Dhamorikar <advaitd@mechasystems.com>
Date: Fri, 27 Nov 2026 15:10:06 +0530
X-Gm-Features: Aa3M54pqKM0_HhnbUssU_T72ZIWahp4yBY12MFpBmxas869Jc17TdRiWDxmiqGk
Message-ID: <CAAPs2HRq=BXVabGvHfK33XcCnu1huzkBW8=VxzaJVcz85Cwc7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pmdomain: imx: fix suspend/resume order of the
 blk-ctrl virtual devices
To: Vitor Soares <ivitro@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vitor Soares <vitor.soares@toradex.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, 
	Marek Vasut <marex@nabladev.com>, Peng Fan <peng.fan@nxp.com>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Tested on i.MX8MP Mecha Comet with both patches applied on top of
7.3.4, Suspend to idle, RAM and resume no longer hangs.

Tested-by: Advait Dhamorikar <advaitd@mechasystems.com>

Best Regards,
Advait
